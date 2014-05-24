<%  
    String ruta = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@page session="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Agenda electr&oacute;nica UDB</title>
	<link rel="stylesheet" type="text/css" href="/agendaElectronica/css/estilo.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="/agendaElectronica/css/estilo_login_responsive.css" media="all" />
</head>
<body>
	<div id="contenido">	
		<div id="header">
			<div id="logo">
			</div>	
		</div>
            <div> <!---INICIO DEL CONTENT--->
                <center>
                     <!--Alertas !--->
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
                    <table>
                        <tr>
                            <td>Usuario:</td>
                            <td><input type="text" name="usuario" required /> </td>
                        </tr>
                        <tr>
                            <td>Contrase&ntilde;a:</td>
                            <td><input type="password" name="pass" required /> </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <center><br />
                                    <input type="Reset" class="btn btn-principal" value="Limpiar" />
                                    <input type="Submit" class="btn btn-principal" value="Ingresar" />
                                </center>
                            </td>

                        </tr>
                   </table>
                        <br /><br />
                  </form>
                </center>
    </body>
</html>
