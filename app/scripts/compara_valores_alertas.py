import psycopg2
from datetime import datetime
import boto3
import pandas as pd
from pestomo_utils import aws_credentials
from envia_email_utils import send_email

HOSTNAME = 'localhost'
USERNAME = 'postgres'
PASSWORD = 'postgres'
DATABASE_NAME = 'prestomo-db'
AWS_BUCKET = 'projeto-aplicado-landing'

session = boto3.Session(profile_name='guilherme')
s3_session = session.resource('s3')
s3_client = session.client("s3")

def load_today_acoes_df():
    _today_date = datetime.today().strftime('%d-%m-%Y')
    paginator = s3_client.get_paginator("list_objects")
    page_iterator = paginator.paginate(Bucket=AWS_BUCKET, Prefix=f'acoes/{_today_date}')
    
    storage_options={
        "key": aws_credentials()['key'],
        "secret": aws_credentials()['secret'],
    }

    files_to_load = []
    for page in page_iterator:
        if "Contents" in page:
            for obj in page["Contents"]:
                if obj['Size'] > 0:
                    files_to_load.append(obj['Key'])

    dfs = []
    for file in files_to_load:
        df = pd.read_json(f"s3://{AWS_BUCKET}/{file}", storage_options=storage_options, lines=True)
        dfs.append(df)

    df_final = pd.concat(dfs, axis=0)
    return df_final

def get_prices_from_alerts(df):
    dict_result = {}
    _today_date = datetime.today().strftime('%d/%m/%Y')
    float_formatter = "{:_.2f}".format
    
    def feed_dict_result(email, nome, sigla, tipo, setado=0.00, fechado=0.00):
        if email not in dict_result:
            dict_usuario = {
                "nome": nome,
                "data": _today_date,
                "alertas": []
            }
            dict_result[email] = dict_usuario
        
        dict_alerta = {
            "sigla": sigla,
            "tipo": tipo,
            "setado": float_formatter(setado).replace('.',',').replace('_','.'),
            "fechado": float_formatter(fechado).replace('.',',').replace('_','.')
        }
        dict_result[email]['alertas'].append(dict_alerta)
    
    with psycopg2.connect( host=HOSTNAME, user=USERNAME, password=PASSWORD, dbname=DATABASE_NAME) as db_connection:
        cur = db_connection.cursor()
        cur.execute("""
            SELECT a.acao_sigla, 
                   a.valor_minimo, 
                   a.valor_maximo,
                   u.nome,
                   u.email
              FROM alertas_configurados a join usuarios u on (a.usuario_id = u.id)
             ORDER BY a.usuario_id, a.id
        """)
        resultado = cur.fetchall()
        for acao_sigla, valor_minimo, valor_maximo, nome, email in resultado:
            preco_fechamento = df[df['sigla'] == acao_sigla]['price'][0]
            if valor_minimo != None:
                if preco_fechamento < valor_minimo:
                    feed_dict_result(email, nome, acao_sigla, 'minimo', float(valor_minimo), float(preco_fechamento))
            if valor_maximo != None:
                if preco_fechamento > valor_maximo:
                    feed_dict_result(email, nome, acao_sigla, 'maximo', float(valor_maximo), float(preco_fechamento))            

    return dict_result

def main():
    try:
        print(' Iniciando a comparação de valores...')
        print(' > carregando dataframe com valores de fechamento das ações')
        df_today_acoes = load_today_acoes_df()
        print(' > buscando alertas cadastrados e comparando critérios')
        dict_emails = get_prices_from_alerts(df_today_acoes)
        if dict_emails:
            print(' > enviando e-mails de alerta')
            send_email(dict_emails)
        print(' Processo finalizado com sucesso!')
    except Exception as e:
        print(' Erro durante o processamento da comparação')
        print(e)

try:
    if __name__ == '__main__':
        main()
except Exception as e:
    print(e)


