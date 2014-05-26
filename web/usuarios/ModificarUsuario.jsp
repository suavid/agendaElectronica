<%-- 
    Document   : ModificarUsuarios
    Created on : 07-abr-2014, 21:48:23
    Author     : Pochii
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conexion.conexion,java.sql.*" %>
<%
    // declarando variables para conexion
    conexion con = null;
    ResultSet rs = null;
    String type = request.getParameter("type"); 
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include  file="../administracion/header.jsp" %>
<%@include  file="../administracion/valTipoUsuario.jsp" %>
<c:if test="${param.idUsuario == null || param.idUsuario == ''}">
    <c:redirect url="MostrarUsuarios.jsp?erno=2" />
</c:if>

<c:set var="idUsuario" value="${param.idUsuario}" />

<sql:query dataSource="jdbc/mysql" var="q1">
    SELECT * FROM usuarios WHERE idUsuario = ${idUsuario}
</sql:query>

    
<div class="unico">
    <div class="center-content top-mar">
    <h2>.:: Modificar Usuarios ::.</h2>
  <form name="modificarUsuario" action="/agendaElectronica/modificarUsuario" method="post" >
     <table>
            <c:forEach var="usr" items="${q1.rows}">
            <tr>
                    <input type="hidden" name="idUsuario" value="${idUsuario}" />
                    <input type="hidden" name="type" value="<%=type%>" />
                    <td>Nombre:</td>
                    <td><input type="text" name="nombre" id="nombre" value="${usr.nombres}" required/> </td>
            </tr>
            <tr>
                    <td>Apellido:</td>
                    <td><input type="text" name="apellido" id="apellido" value="${usr.apellidos}"/></td>
            </tr>
            <tr>
                    <td>Usuario:</td>
                    <td><input type="text" name="usuario" id="usuario"value="${usr.username}"  readonly required/></td>
            </tr>

            <tr>
                    <td>Contrase&ntilde;a:</td>
                    <td><input type="password" name="pass" id="pass" /></td>
            </tr>

            <tr>
                    <td>Repetir contrase&ntilde;a:</td>
                    <td><input type="password" name="pass2" id="pass2" oninput="check(this)"/></td>
            </tr>


            <tr>
                    <td>Telefono M&oacute;vil:</td>
                    <td><input type="text" name="telefono" id="telefono" value="${usr.telefonoMovil}" maxLength="8" required /></td>
            </tr>

            <tr>
                    <td>Tipo Usuario</td>
                    <td>
                        <select name="tipoUsuario" >
                         <option value="${usr.tipoUsuario}">${usr.tipoUsuario}</option>
                         <sql:query var="q2" dataSource="jdbc/mysql">
                             SELECT tipoUsuario from tipoUsuario WHERE tipoUsuario != '${usr.tipoUsuario}'
                         </sql:query>
                         <c:forEach var="ti" items="${q2.rows}">
                             <option value="${ti.tipoUsuario}" >${ti.tipoUsuario}</option>
                         </c:forEach>    
                         </select>
                    </td>
            </tr>

            <tr>
                    <td colspan="2"><center><br />
                    <input type="Submit" value="Modificar" />	
                    </center></td>
            </tr>
            </c:forEach>
       </table>  
</div>
  </form>            
 </body>
 
 <script language='javascript' type='text/javascript'>
    function check(input) {
    if (input.value != document.getElementById('pass').value) {
    input.setCustomValidity('Contraseñas deben coincidir');
    } else {
     input.setCustomValidity('');
    }
}
</script>
  </div> 
 
<div style="clear: both;"></div>
<%@include  file="../administracion/footer.jsp" %>
