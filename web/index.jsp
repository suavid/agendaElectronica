<%-- 
    Document   : index
    Created on : 06-abr-2014, 10:24:35
    Author     : Jorge
--%>
<%@include file="administracion/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="unico">
    <sql:query dataSource="jdbc/mysql" var="q1">
        SELECT * FROM usuarios WHERE idUsuario = <%=idUsuario%>
    </sql:query>
 <center>        
    <h2>Mis datos</h2>
    <c:forEach var="usr" items="${q1.rows}">
        <table>
             <tr>
                    <td>Nombre:</td>
                    <td><label>${usr.nombres}</label> </td>
            </tr>

            <tr>
                    <td>Apellido:</td>
                    <td><label>${usr.apellidos}</label></td>
            </tr>

            <tr>
                    <td>Usuario:</td>
                    <td><label>${usr.username}</label></td>
            </tr>
            <tr>
                    <td>Telefono M&oacute;vil:</td>
                    <td><label>${usr.telefonoMovil}</label></td>
            </tr>

            <tr>
                    <td>Tipo Usuario</td>
                    <td>
                        <label>${usr.tipoUsuario}</label>
                    </td>
            </tr>
        </table>
    </c:forEach>
    <br />
    <a href="usuarios/ModificarUsuario.jsp?type=p&idUsuario=<%=idUsuario%>" class="btn btn-principal">Modificar mis datos</a>
 </center>	
</div>
<div style="clear: both;"></div>
<%@include  file="administracion/footer.jsp" %>