import requests as r
import psycopg2
from datetime import datetime
import json
from pestomo_utils import api_key
import boto3

HOSTNAME = 'localhost'
USERNAME = 'postgres'
PASSWORD = 'postgres'
DATABASE_NAME = 'prestomo-db'
API_KEY = api_key()
API_URL = f'https://api.hgbrasil.com/finance/stock_price?key={API_KEY}&symbol='
AWS_BUCKET = 'projeto-aplicado-landing'

session = boto3.Session(profile_name='guilherme')
s3_session = session.resource('s3')
s3_client = session.client("s3")

def insert_s3(file, file_name, aws_bucket, path):
    try:
        path = f"{path}/{file_name}"
        s3_session.Object(aws_bucket, path).put(Body=file)
    except Exception as e:
        raise ValueError(e)

def get_stock_price(stock):
    _full_endpoint_api = API_URL+stock
    result = r.get(_full_endpoint_api)
    json_result = result.json()
    stock_price = 0
    if 'results' in json_result:
        stock_price = json_result['results'][stock]['price']
    
    dict_return = {
        "sigla": stock,
        "price": stock_price
    }
    return dict_return

def get_prices_from_alerts():
    with psycopg2.connect( host=HOSTNAME, user=USERNAME, password=PASSWORD, dbname=DATABASE_NAME) as db_connection:
        cur = db_connection.cursor()
        cur.execute( "SELECT distinct acao_sigla FROM alertas_configurados order by acao_sigla" )
        for sigla in cur.fetchall():
            sigla_busca = sigla[0]
            stock_price = get_stock_price(sigla_busca)
            today_date = datetime.today()
            file_name = '{}.json'.format(sigla_busca)
            path_to_save = "acoes/{}".format(today_date.strftime('%d-%m-%Y'))
            insert_s3(json.dumps(stock_price), file_name, AWS_BUCKET, path_to_save)            

def main():
    try:
        print(" Iniciando a busca dos fechamentos de ações para o dia {}".format(datetime.today().strftime("%d/%m/%Y")))
        get_prices_from_alerts()
        print(" Busca finalizada!")
    except Exception as e:
        print(" Erro ao executar a busca!")
        print(e)

try:
    if __name__ == '__main__':
        main()
except Exception as e:
    print(e)


