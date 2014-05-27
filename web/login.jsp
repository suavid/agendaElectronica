<%  
    String ruta = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN"
    "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Agenda electr&oacute;nica UDB</title>
    <link rel="stylesheet" type="text/css" href="/agendaElectronica/css/estilo.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/agendaElectronica/css/estilo_responsive.css" media="all" />
    <link rel="stylesheet" type="text/css" href="/agendaElectronica/css/estilo_login_responsive.css" media="all" />
</head>
<body>
    <div id="contenido">	
	<div id="header" ></div>
        <div>
            <div class="center-content">
            <%
                  if (request.getParameter("erno") != null)
                  {
                      int error = Integer.parseInt(request.getParameter("erno"));
                      
                      switch (error)
                      {
                          case 10:
                            out.print(" <div class=\"alert alert-danger fade in\">"
                                      + "Debe autenticarse para ingresar al sistema</div>");
                            break;  
                          case 11:
                            out.print(" <div class=\"alert alert-danger fade in\">"
                                      + "No posee suficientes privilegios para entrar a esta opci&oacute;n</div>");
                            break;
                          case 12:
                              out.print(" <div class=\"alert alert-danger fade in\">"
                                      + "Usuario o contrase&ntilde;a incorrectos</div>");
                            break;
                      }
                      
                  }                  
         %>
                <h1>Ingreso al sistema</h1>
                <form action="/agendaElectronica/procesarLogueo" method="post">
                <table class="center-simple">
                    <tr>
                        <td>Usuario:</td>
                        <td><input type="text" name="usuario"/> </td>
                    </tr>
                    <tr>
                        <td>Contrase&ntilde;a:</td>
                        <td><input type="password" name="pass"/> </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        <br/>
                        <input type="reset" class="btn btn-principal" value="Limpiar" />
                        <input type="submit" class="btn btn-principal" value="Ingresar" />
                        </td>

                    </tr>
                </table>
                </form>
          </div>
        </div>
    </div>
</body>
</html>
