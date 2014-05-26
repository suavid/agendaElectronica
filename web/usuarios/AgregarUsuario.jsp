<%-- 
    Document   : AgregarUsuario
    Created on : 04-07-2014, 02:07:51 PM
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conexion.conexion,java.sql.*" %>
<%
    // declarando variables para conexion
    conexion con = null;
    ResultSet rs = null;
    
%>

<%@include  file="../administracion/header.jsp" %>
<%@include  file="../administracion/valTipoUsuario.jsp" %>
<div class="unico">
    <div class="center-content top-mar">
    <h2>.:: Agregar Nuevo Usuario ::.</h2>
  <form name="agregarUsuario" action="/agendaElectronica/agregarUsuario" method="post" >
           
     <table>

            <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="nombre" id="nombre" required/> </td>
            </tr>

            <tr>
                    <td>Apellido:</td>
                    <td><input type="text" name="apellido" id="apellido"/></td>
            </tr>

            <tr>
                    <td>Usuario:</td>
                    <td><input type="text" name="usuario" id="usuario" required/></td>
            </tr>

            <tr>
                    <td>Contrase&ntilde;a:</td>
                    <td><input type="password" name="pass" id="pass" required/></td>
            </tr>

            <tr>
                    <td>Repetir contrase&ntilde;a:</td>
                    <td><input type="password" name="pass2" id="pass2" required oninput="check(this)"/></td>
            </tr>


            <tr>
                    <td>Telefono M&oacute;vil:</td>
                    <td><input type="text" name="telefono" id="telefono" maxLength="9"  placeholder="Celular Ej. 7994-7895" required /></td>
            </tr>

            <tr>
                    <td>Tipo Usuario</td>
                    <td>
                        <select name="tipoUsuario" >
                         <%
                             String query="select * from tipoUsuario";
                             con = new conexion();
                             con.setRS(query);
                             rs = (ResultSet) con.getRs();
                             while (rs.next())
                             {%>
                             <option value="<%=rs.getString("tipoUsuario") %>" ><%=rs.getString("tipoUsuario")%></option>
                             <%
                             }
                             con.cerrarConexion();
                         %>
                         </select>
                    </td>
            </tr>

            <tr>
                    <td colspan="2"><center><br />
                    <input type="Submit" value="Agregar" />
                    <input type="reset" value="Limpiar" />	
                    </center></td>
            </tr>

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