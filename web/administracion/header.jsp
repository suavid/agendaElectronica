<%
    String ruta = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@page session="true" %>

<%! String nombreUsuario = ""; %>
<%! String idUsuario = ""; %>
<%! String tipoUsuario = ""; %>

 <%
    // SessionActual ya existe!
  HttpSession SessionActual = request.getSession(false);
  try 
  { 
      nombreUsuario = (String) SessionActual.getAttribute("nombreUsuario");
      tipoUsuario = (String) SessionActual.getAttribute("tipoUsuario");
      idUsuario = (String) SessionActual.getAttribute("idUsuario");
            
      if (nombreUsuario == "")
      { }
      if (nombreUsuario == null)
      { }
      
      if (idUsuario.equals(""))
      {
      }
      if (idUsuario.equals(null))
      {
          response.sendRedirect(ruta + "/login.jsp?erno=10");
      }
      if (tipoUsuario == "")
      { }
      if (tipoUsuario == null)
      { }
       if (tipoUsuario.equals(""))
      { }
      if (tipoUsuario.equals(null))
      { }
     
   }
  
  catch (Exception e)
  { response.sendRedirect(ruta +"/login.jsp?erno=10");
 }  
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Agenda electr&oacute;nica UDB</title>
	<link rel="stylesheet" type="text/css" href="/agendaElectronica/css/estilo.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="/agendaElectronica/css/estilo_responsive.css" media="all" />
</head>
<body>
	<div id="contenido">	
		<div id="header">
			<div id="logo">
			</div>	
		</div>
                
            <div id="userName"><b>Bienvenido:  </b><font color="red"><%= nombreUsuario%></font></div>
            
		<ul id="menu">
			<li><a class="current" href="<%=ruta%>/index.jsp">Mi cuenta</a></li><!-- Actual Seleccionado -->
			<li><a href="<%=ruta%>/contactos/MostrarContactos.jsp">Contactos</a></li>
			<% 
                        // no mostrar menur usuarios sino es administrador
                        if(tipoUsuario.equals("Administrador"))
                        {
                            %>
                         <li><a href="<%=ruta%>/usuarios/MostrarUsuarios.jsp">Usuarios</a></li>
                            <%
                        }
                        %>
                       
			
                        <li><a href="<%=ruta%>/administracion/CerrarSession.jsp">Cerrar Sesi&oacute;n</a></li>
		</ul>
                
            <div> <!---INICIO DEL CONTENT--->
            <!--Alertas !--->
            <%
                  if (request.getParameter("erno") != null)
                  {
                      int error = Integer.parseInt(request.getParameter("erno"));
                      
                      switch (error)
                      {
                          case 1:
                              out.print(" <div class=\"alert alert-danger fade in\">"
                                      + "Error en la comunicaci&oacute;n con la base de datos. Alguno de los datos enviados fue err&oacute;neo</div>");
                          break;
                          
                          case 2:
                              out.print(" <div class=\"alert alert-danger fade in\">"
                                      + "Error. La p&aacute;gina a la que intent&oacute; acceder debe ser llamada desde un formulario</div>");
                          break;
                              
                          case 3:
                              out.print(" <div class=\"alert alert-danger fade in\">"
                                      + "Error. Existen datos err&oacute;neos o vac&iacute;os en el formulario, por favor verifique todos los campos</div>");
                          break;
                              
                          case 4:
                              out.print(" <div class=\"alert alert-warning fade in\"> "
                                      + "No hay datos que mostrar</div>");
                          break;
                              
                          case 5:
                              out.print(" <div class=\"alert alert-danger fade in\"> " 
                                      + "No hay datos que mostrar</div>");
                          break;
                              
                          case 6:
                              out.print(" <div class=\"alert alert-danger\">Existe un conflicto con un registro en la base de datos</div>");
                          break;
                              
                          case 7:
                            out.print(" <div class=\"alert alert-danger fade in\">"
                                      + "Contrase&ntilde;a actual no coincide</div>");
                          break;
                              
                          case 8:
                            out.print(" <div class=\"alert alert-danger fade in\">"
                                      + "Contrase&ntilde;a nueva no coinciden</div>");
                            break;  
                              
                          case 9:
                                  out.print(" <div class=\"alert alert-danger fade in\">"
                                      + "No tiene Privilegios para ingresar</div>");
                          break;
                              
                          case 10:
                                  out.print(" <div class=\"alert alert-danger fade in\">"
                                      + "No se puede eliminar, su propia cuenta</div>");
                          break;
                       
                              
                      }
                  }
                  if(request.getParameter("exito")!=null)
                  {
                     // String exito = request.getParameter("exito");
                      if(request.getParameter("exito").equals("in"))
                              out.print("<div class=\"alert alert-success fade in\"> "
                                      + "Registro insertado con &eacute;xito</div>");
                      if(request.getParameter("exito").equals("up"))
                              out.print("<div class=\"alert alert-success fade in\"> "
                                      + "Registro actualizado con &eacute;xito</div>");
                      if(request.getParameter("exito").equals("del"))
                              out.print("<div class=\"alert alert-success fade in\"> "
                                      + "Registro eliminado con &eacute;xito</div>");
                      if(request.getParameter("exito").equals("1") || request.getParameter("exito").equals("2") || request.getParameter("exito").equals("3") )
                              out.print("<div class=\"alert alert-success fade in\"> "
                                      + "Operaci&oacute;n exitosa</div>");
                      }                     
         %>