<%-- 
    Document   : valTipoUsuario
    Created on : 04-09-2014, 01:34:49 PM
    Author     : jorge
--%>
<%@page session="true" %>

<%
    // recuperando sessionActual
  // HttpSession SessionActual = request.getSession(false);
    //tipoUsuario
    String tipoUsuario = SessionActual.getAttribute("tipoUsuario").toString();
    
    if (!tipoUsuario.equals("Administrador"))
    {
        response.sendRedirect("/agendaElectronica/index.jsp?erno=9");
    }
            
    
%>