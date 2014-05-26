<%-- 
    Document   : EliminarUsuario
    Created on : 04-07-2014, 03:58:43 PM
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conexion.conexion,java.sql.*" %>

<%@include  file="../administracion/header.jsp" %>
<%@include  file="../administracion/valTipoUsuario.jsp" %>
<div class="unico">
<%
    // declarando variables para conexion
    String id = request.getParameter("id");
    String qr="select * from usuarios where idUsuario=" + id;

    conexion con = new conexion();
    con.setRS(qr);
    ResultSet rs = (ResultSet) con.getRs();
    if(rs.next())
    {
%>

    <div class="center-content top-mar">
    <h2>.:: Eliminar Usuario ::.</h2>
        <form name="eliminarForm" id="eliminarForm" action="/agendaElectronica/eliminarUsuario" method="post">
         <table>

            <tr>
                    <td>Nombre:</td>
                    <td>
                        
                        <input type="hidden" name="id" id="id" value="<%= id %>" />
                        <input type="text" name="nombre" id="nombre" value="<%= rs.getString("nombres") %>" ReadOnly />
                    </td>
            </tr>

            <tr>
                    <td>Apellido:</td>
                    <td><input type="text" name="apellido" id="apellido" value="<%= rs.getString("apellidos") %>" ReadOnly /></td>
            </tr>

            <tr>
                    <td>Usuario:</td>
                    <td><input type="text" name="usuario" id="usuario" value="<%= rs.getString("username") %>" ReadOnly /></td>
            </tr>

            <tr>
                    <td>Telefono M&oacute;vil:</td>
                    <td><input type="text" name="telefono" id="telefono" maxLength="8" value="<%= rs.getString("telefonoMovil") %>" ReadOnly /></td>
            </tr>

            <tr>
                    <td>Tipo Usuario</td>
                    <td>
                        <input type="text" name="tipoUsuario" id="tipoUsuario" value="<%= rs.getString("tipoUsuario") %>" ReadOnly />
                    </td>
            </tr>

            <tr>
                    <td colspan="2"><center>
                        <br/>
                    <input type="button" value="Eliminar" OnClick="confirmation();"/>
	
                    </center></td>
            </tr>

       </table>  
    </form>
        <% } 
        %>
        
    </body>
    
     <script type="text/javascript">

        function confirmation() {
                var answer = confirm("¿Deseas eliminar el usuario?, se eliminaran todos sus contactos")
                if (answer){
                       document.getElementById("eliminarForm").submit();
                }
                else{
                        history.back(1);
                }
        }
</script>
</div>
</div>   
<div style="clear: both;"></div>
<%@include  file="../administracion/footer.jsp" %>