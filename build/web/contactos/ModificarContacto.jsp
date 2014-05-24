<%-- 
    Document   : ModificarContacto
    Created on : 04-07-2014, 09:40:02 PM
    Author     : jorge
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.conexion"%>
<%@include file="../administracion/header.jsp" %>
<%

     //  tomando id del contacto a modificar
     String id = request.getParameter("id");
     conexion con = new conexion();
     String query = "select * from contacto where idContacto=" + id;
     con.setRS(query);
     ResultSet rs = (ResultSet) con.getRs();
     if (rs.next())
     {
     
%>
<div class="unico">
        <fieldset>
            <legend>Modificar contacto</legend>
            <form name="frmContactos" action="/agendaElectronica/modificarContacto" method="POST" action="">
                <table>
                    <tr><input type="hidden" name="idUsuario" value="1" /></tr>
                    <tr>
                        <td><b>*Nombre:</b></td>
                        <td>
                            <input type="hidden" name="id" id="id" value="<%=rs.getString("idContacto") %>" />
                            <input type="text" class="form-control requerido" name="nombres" id="nombres" 
                                   required value="<%=rs.getString("nombres") %>" />
                        </td>
                        <td>
                            <div id='divnombres'></div>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Apellidos:</b></td>
                        <td>
                            <input type="text" class="form-control" name="apellidos" id="apellidos" value="<%=rs.getString("apellidos") %>" />
                        </td>
                        <td>
                            <div id='divapellidos'></div>
                        </td>
                    </tr>
                    <tr>
                        <td>*Tel&eacute;fono m&oacute;vil:</td>
                        <td>
                            <input type="text" class="form-control requerido" name="telefonoMovil" id="telefonoMovil" 
                                   placeholder="Celular Ej. 7923-6354" maxlength="9" value="<%=rs.getString("telefonoMovil") %>" />
                        </td>
                        <td>
                            <div id='divtelefonoMovil'></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Tel&eacute;fono de trabajo:</td>
                        <td>
                            <input type="text" class="form-control" name="telefonoTrabajo" maxlength="9" id="telefonoTrabajo"  value="<%=rs.getString("telefonoTrabajo") %>"/>
                        </td>
                        <td>
                            <div id='divtelefonoTrabajo'></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Direcci&oacute;n:</td>
                        <td>
                            <textarea class="form-control" name="direccion" id="direccion" cols="10" rows="6" value=><%=rs.getString("direccion") %>
                            </textarea>
                        </td>
                        <td>
                            <div id='divdireccion'></div>
                        </td>
                    </tr>
                    <tr>
                        <td>E-mail:</td>
                        <td>
                            <input type="text" class="form-control" name="email" id="email" value="<%=rs.getString("email") %>"/>
                        </td>
                        <td>
                            <div id='divemail'></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="Guardar contacto" />
                        </td>
                        <td>
                            <input type="reset" value="Limpiar formulario" />
                        </td>
                    </tr>
                </table>
            </form>
        </fieldset>
    <% } %>
</div>
<div style="clear: both;"></div>
<script lang="javascript" src="<%=ruta%>/js/validacion.js"></script>

<%@include file="../administracion/footer.jsp"%> 