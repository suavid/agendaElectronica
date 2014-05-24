<%
    // destruir session actual!
    HttpSession sessionActual = request.getSession();
    session.invalidate();
    String ruta = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    // direccionar a la pagina de logueo
    response.sendRedirect( ruta +"/login.jsp");
    
%>