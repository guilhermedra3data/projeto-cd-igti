import smtplib, ssl
from pestomo_utils import gmail_key
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

html_head = """
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0079)file:///home/guilherme/docker-aulas/projeto-aplicado/html/pestomo_template.html -->
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:o="urn:schemas-microsoft-com:office:office" style="width:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta name="x-apple-disable-message-reformatting">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="telephone=no" name="format-detection">
  <title>Pestomo info mail</title><!--[if (mso 16)]>
    <style type="text/css">
    a {text-decoration: none;}
    </style>
    <![endif]--><!--[if gte mso 9]><style>sup { font-size: 100% !important; }</style><![endif]--><!--[if gte mso 9]>
<xml>
    <o:OfficeDocumentSettings>
    <o:AllowPNG></o:AllowPNG>
    <o:PixelsPerInch>96</o:PixelsPerInch>
    </o:OfficeDocumentSettings>
</xml>
<![endif]--><!--[if !mso]><!-- -->
  <link href="./pestomo_template_files/css" rel="stylesheet"><!--<![endif]-->
  <style type="text/css">
#outlook a {
	padding:0;
}
.ExternalClass {
	width:100%;
}
.ExternalClass,
.ExternalClass p,
.ExternalClass span,
.ExternalClass font,
.ExternalClass td,
.ExternalClass div {
	line-height:100%;
}
.es-button {
	mso-style-priority:100!important;
	text-decoration:none!important;
}
a[x-apple-data-detectors] {
	color:inherit!important;
	text-decoration:none!important;
	font-size:inherit!important;
	font-family:inherit!important;
	font-weight:inherit!important;
	line-height:inherit!important;
}
.es-desk-hidden {
	display:none;
	float:left;
	overflow:hidden;
	width:0;
	max-height:0;
	line-height:0;
	mso-hide:all;
}
[data-ogsb] .es-button {
	border-width:0!important;
	padding:15px 30px 15px 30px!important;
}
@media only screen and (max-width:600px) {p, ul li, ol li, a { line-height:150%!important } h1, h2, h3, h1 a, h2 a, h3 a { line-height:120%!important } h1 { font-size:32px!important; text-align:center } h2 { font-size:26px!important; text-align:center } h3 { font-size:20px!important; text-align:center } .es-header-body h1 a, .es-content-body h1 a, .es-footer-body h1 a { font-size:32px!important } .es-header-body h2 a, .es-content-body h2 a, .es-footer-body h2 a { font-size:26px!important } .es-header-body h3 a, .es-content-body h3 a, .es-footer-body h3 a { font-size:20px!important } .es-menu td a { font-size:16px!important } .es-header-body p, .es-header-body ul li, .es-header-body ol li, .es-header-body a { font-size:16px!important } .es-content-body p, .es-content-body ul li, .es-content-body ol li, .es-content-body a { font-size:16px!important } .es-footer-body p, .es-footer-body ul li, .es-footer-body ol li, .es-footer-body a { font-size:16px!important } .es-infoblock p, .es-infoblock ul li, .es-infoblock ol li, .es-infoblock a { font-size:12px!important } *[class="gmail-fix"] { display:none!important } .es-m-txt-c, .es-m-txt-c h1, .es-m-txt-c h2, .es-m-txt-c h3 { text-align:center!important } .es-m-txt-r, .es-m-txt-r h1, .es-m-txt-r h2, .es-m-txt-r h3 { text-align:right!important } .es-m-txt-l, .es-m-txt-l h1, .es-m-txt-l h2, .es-m-txt-l h3 { text-align:left!important } .es-m-txt-r img, .es-m-txt-c img, .es-m-txt-l img { display:inline!important } .es-button-border { display:inline-block!important } a.es-button, button.es-button { font-size:16px!important; display:inline-block!important; border-width:15px 30px 15px 30px!important } .es-btn-fw { border-width:10px 0px!important; text-align:center!important } .es-adaptive table, .es-btn-fw, .es-btn-fw-brdr, .es-left, .es-right { width:100%!important } .es-content table, .es-header table, .es-footer table, .es-content, .es-footer, .es-header { width:100%!important; max-width:600px!important } .es-adapt-td { display:block!important; width:100%!important } .adapt-img { width:100%!important; height:auto!important } .es-m-p0 { padding:0px!important } .es-m-p0r { padding-right:0px!important } .es-m-p0l { padding-left:0px!important } .es-m-p0t { padding-top:0px!important } .es-m-p0b { padding-bottom:0!important } .es-m-p20b { padding-bottom:20px!important } .es-mobile-hidden, .es-hidden { display:none!important } tr.es-desk-hidden, td.es-desk-hidden, table.es-desk-hidden { width:auto!important; overflow:visible!important; float:none!important; max-height:inherit!important; line-height:inherit!important } tr.es-desk-hidden { display:table-row!important } table.es-desk-hidden { display:table!important } td.es-desk-menu-hidden { display:table-cell!important } .es-menu td { width:1%!important } table.es-table-not-adapt, .esd-block-html table { width:auto!important } table.es-social { display:inline-block!important } table.es-social td { display:inline-block!important } .es-desk-hidden { display:table-row!important; width:auto!important; overflow:visible!important; max-height:inherit!important } }
</style>
 </head>
 """

html_top = """
 <body style="width:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;font-family:&#39;open sans&#39;, &#39;helvetica neue&#39;, helvetica, arial, sans-serif;padding:0;Margin:0">
  <div class="es-wrapper-color" style="/* background-color:#EEEEEE; */"><!--[if gte mso 9]>
			<v:background xmlns:v="urn:schemas-microsoft-com:vml" fill="t">
				<v:fill type="tile" color="#eeeeee"></v:fill>
			</v:background>
		<![endif]-->
   <table class="es-wrapper" width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top">
     <tbody><tr style="border-collapse:collapse">
      <td valign="top" style="padding:0;Margin:0">
       
       <table class="es-content" cellspacing="0" cellpadding="0" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%">
         <tbody><tr style="border-collapse:collapse"></tr>
         <tr style="border-collapse:collapse">
          <td align="center" style="padding:0;Margin:0">
           <table class="es-header-body" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#044767;width:600px" cellspacing="0" cellpadding="0" bgcolor="#044767" align="center">
             <tbody><tr style="border-collapse:collapse">
              <td align="left" style="Margin:0;padding-top:35px;padding-bottom:35px;padding-left:35px;padding-right:35px">
               <table cellspacing="0" cellpadding="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tbody><tr style="border-collapse:collapse">
                  <td class="es-m-p0r" valign="top" align="center" style="padding:0;Margin:0;width:530px">
                   <table width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tbody><tr style="border-collapse:collapse">
                      <td class="es-m-txt-c" align="left" style="padding:0;Margin:0"><h1 style="Margin:0;line-height:36px;mso-line-height-rule:exactly;font-family:&#39;open sans&#39;, &#39;helvetica neue&#39;, helvetica, arial, sans-serif;font-size:36px;font-style:normal;font-weight:bold;color:#ffffff">Pestomo</h1></td>
                     </tr>
                   </tbody></table></td>
                 </tr>
               </tbody></table></td>
             </tr>
           </tbody></table></td>
         </tr>
       </tbody></table>
       <table class="es-content" cellspacing="0" cellpadding="0" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%">
         <tbody><tr style="border-collapse:collapse">
          <td align="center" style="padding:0;Margin:0">
           <table class="es-content-body" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFFFF;width:600px">
             <tbody><tr style="border-collapse:collapse">
              <td align="left" style="padding:0;Margin:0;padding-left:35px;padding-right:35px;padding-top:40px">
               <table width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tbody><tr style="border-collapse:collapse">
                  <td valign="top" align="center" style="padding:0;Margin:0;width:530px">
                   <table width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tbody><tr style="border-collapse:collapse">
                      <td align="center" style="padding:0;Margin:0;padding-bottom:10px"><h2 style="Margin:0;line-height:36px;mso-line-height-rule:exactly;font-family:&#39;open sans&#39;, &#39;helvetica neue&#39;, helvetica, arial, sans-serif;font-size:30px;font-style:normal;font-weight:bold;color:#333333">Relatório de alertas</h2></td>
                     </tr>
                     <tr style="border-collapse:collapse">
                      <td align="left" style="padding:0;Margin:0;padding-top:15px;padding-bottom:20px"><p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:&#39;open sans&#39;, &#39;helvetica neue&#39;, helvetica, arial, sans-serif;line-height:24px;color:#777777;font-size:16px">Caro <strong>{nome}</strong>.<br><br>No dia <strong>{data_alerta}</strong> alguns de seus alertas definidos no Pestomo atingiram os critérios definidos. Veja abaixo os alertas gerados:</p></td>
                     </tr>
                   </tbody></table></td>
                 </tr>
               </tbody></table></td>
             </tr>
           </tbody></table></td>
         </tr>
       </tbody></table>
       <table class="es-content" cellspacing="0" cellpadding="0" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%">
         <tbody>
"""

html_alertas = """
          <tr style="border-collapse:collapse" data-id="alertas">
          <td align="center" style="padding:0;Margin:0">
           <table class="es-content-body" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFFFF;width:600px">
             
             <tbody><tr style="border-collapse:collapse">
              <td align="left" style="padding:0;Margin:0;/* padding-top:20px; */padding-left:35px;padding-right:35px">
               <table cellspacing="0" cellpadding="0" width="100%" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tbody><tr style="border-collapse:collapse">
                  <td valign="top" align="center" style="padding:0;Margin:0;width:530px">
                   <table width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tbody><tr style="border-collapse:collapse;align-content: center;align-items: center;align-self: center;text-align: center;">
                      <td bgcolor="#eeeeee" align="center" style="Margin:0;padding-top:10px;padding-bottom:10px;padding-left:10px;padding-right:10px;text-align: center;">
                       <table style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;width:500px" class="cke_show_border" cellspacing="1" cellpadding="1" border="0" align="left">
                         <tbody><tr style="border-collapse:collapse">
                          <td style="padding:0;Margin:0;font-size: 16px;">AÇÃO <strong>{acao}</strong> ATINGIU O CRITÉRIO ABAIXO</td>
                         </tr>
                       </tbody></table></td>
                     </tr>
                   </tbody></table></td>
                 </tr>
               </tbody></table></td>
             </tr>
             <tr style="border-collapse:collapse">
              <td align="left" style="padding:0;Margin:0;padding-left:35px;padding-right:35px">
               <table width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tbody><tr style="border-collapse:collapse">
                  <td valign="top" align="center" style="padding:0;Margin:0;width:530px">
                   <table width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tbody><tr style="border-collapse:collapse">
                      <td align="left" style="Margin:0;padding-top:10px;padding-bottom:10px;padding-left:10px;padding-right:10px">
                       <table style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;width:500px" class="cke_show_border" cellspacing="1" cellpadding="1" border="0" align="left">
                         <tbody><tr style="border-collapse:collapse">
                          <td style="padding:5px 10px 5px 0;Margin:0" align="left"><p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:&#39;open sans&#39;, &#39;helvetica neue&#39;, helvetica, arial, sans-serif;line-height:24px;color:#333333;font-size:16px">Critério: <strong>{criterio}</strong></p></td>
                         </tr>
                         <tr style="border-collapse:collapse">
                          <td style="padding:5px 10px 5px 0;Margin:0" align="left"><p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:&#39;open sans&#39;, &#39;helvetica neue&#39;, helvetica, arial, sans-serif;line-height:24px;color:#333333;font-size:16px">Valor alvo: <strong>R$ {alvo}</strong></p></td>
                         </tr>
                         <tr style="border-collapse:collapse">
                          <td style="padding:5px 10px 5px 0;Margin:0;font-color:red" align="left"><p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:&#39;open sans&#39;, &#39;helvetica neue&#39;, helvetica, arial, sans-serif;line-height:24px;color:#333333;font-size:16px">Valor atingido: <strong><span style="color: red;">R$ {fechamento}</span></strong></p></td>
                         </tr>
                       </tbody></table></td>
                     </tr>
                   </tbody></table></td>
                 </tr>
               </tbody></table></td>
             </tr>
             
             
           </tbody></table></td>
          </tr>
"""

html_final = """
       </tbody></table>
       <table class="es-content" cellspacing="0" cellpadding="0" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%">
         <tbody><tr style="border-collapse:collapse">
          <td align="center" style="padding:0;Margin:0">
           <table class="es-content-body" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#1b9ba3;width:600px" cellspacing="0" cellpadding="0" bgcolor="#1b9ba3" align="center">
             <tbody><tr style="border-collapse:collapse">
              <td align="left" style="Margin:0;/* padding-top:35px; *//* padding-bottom:35px; *//* padding-left:35px; *//* padding-right:35px; */">
               <table width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                 <tbody><tr style="border-collapse:collapse">
                  <td valign="top" align="center" style="padding:0;Margin:0;width:530px">
                   <table width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">
                     <tbody><tr style="border-collapse:collapse">
                      <td align="center" style="padding:0;Margin:0;padding-top:25px;padding-bottom: 25px;"><h2 style="Margin:0;line-height:29px;mso-line-height-rule:exactly;font-family:&#39;open sans&#39;, &#39;helvetica neue&#39;, helvetica, arial, sans-serif;font-size: 16px;font-style:normal;font-weight:bold;color:#ffffff">Não esqueça de ajustar seus critérios para não receber alertas repetidos.</h2></td>
                     </tr>
                     
                   </tbody></table></td>
                 </tr>
               </tbody></table></td>
             </tr>
           </tbody></table></td>
         </tr>
       </tbody></table>
       
       </td>
     </tr>
   </tbody></table>
  </div>
 
</body></html>
"""

SENDER = "pestomoapp@gmail.com"
PASSWORD = gmail_key()
SUBJECT = "[PESTOMO ALERT] - Seus critérios de alertas foram atingidos!"

def smtp_server(text_message, html_message, email_receiver):
    
    message = MIMEMultipart("alternative")
    message["Subject"] = SUBJECT
    message["From"] = SENDER
    message["To"] = email_receiver
    
    text = text_message
    html = html_message
    
    part1 = MIMEText(text, "plain")
    part2 = MIMEText(html, "html")

    message.attach(part1)
    message.attach(part2)

    context = ssl.create_default_context()
    with smtplib.SMTP_SSL("smtp.gmail.com", 465, context=context) as server:
        server.login(SENDER, PASSWORD)
        server.sendmail(
            SENDER, email_receiver, message.as_string()
        )

def send_email(dict_content):
    for email, dados in dict_content.items():
        _destinatario = email
        _nome = dados['nome']
        _data_alerta = dados['data']
               
        _mensagem_texto = f"""
            Caro {_nome},
            No dia {_data_alerta} alguns de seus alertas definidos no Pestomo atingiram os critérios definidos. 
            Veja abaixo os alertas gerados:
        """
        _mensagem_html = html_head
        _mensagem_html += html_top.format(nome=_nome,data_alerta=_data_alerta)
        
        count = 0
        for alerta in dados['alertas']:
            count += 1
            _mensagem_texto += """
                ------------------
                Alerta: {count} "asd"
                Critério: {criterio}
                Alvo considerado: {alvo}
                Fechamento: {fechamento}
                Mensagem: A ação {acao} atingiu o critério definido acima!
            """.format(count=count,
                       criterio="Preço máximo" if alerta['tipo'] == 'maximo' else "Preço mínimo",
                       alvo=alerta['setado'],
                       fechamento=alerta['fechado'],
                       acao=alerta['sigla']
                      )
            
            _mensagem_html += html_alertas.format(
                criterio="Preço máximo" if alerta['tipo'] == 'maximo' else "Preço mínimo",
                alvo=alerta['setado'],
                fechamento=alerta['fechado'],
                acao=alerta['sigla']
            )
            
        _mensagem_html += html_final            
        
        smtp_server(_mensagem_texto, _mensagem_html, _destinatario)