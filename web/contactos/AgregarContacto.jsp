<%@include file="../administracion/header.jsp" %>
<div class="unico">
 <fieldset>
 <legend>Agregar contacto</legend>
 <form id="frmContactos" action="/agendaElectronica/agregarContacto" method="post" >
  <table>
 <tr><td><input type="hidden" name="idUsuario" value="<%=idUsuario%>" /></td><td></td></tr>
 <tr>
 <td><b>*Nombre:</b></td>
 <td>
 <input type="text" class="form-control requerido" name="nombres" id="nombres" onblur="validar('nombres');"/>
 </td>
 <td>
 <div id='divnombres'></div>
 </td>
 </tr>
 <tr>
 <td><b>Apellidos:</b></td>
 <td>
 <input type="text" class="form-control" name="apellidos" id="apellidos" onblur="validar('apellidos');" />
 </td>
 <td>
 <div id='divapellidos'></div>
 </td>
 </tr>
 <tr>
 <td>*Tel&eacute;fono m&oacute;vil:</td>
 <td>
 <input type="text" class="form-control requerido" name="telefonoMovil" id="telefonoMovil" maxlength="9" onblur="validar('telefonoMovil');"/>
 </td>
 <td>
 <div id='divtelefonoMovil'></div>
 </td>
 </tr>
 <tr>
 <td>Tel&eacute;fono de trabajo:</td>
 <td>
 <input type="text" class="form-control" name="telefonoTrabajo" maxlength="9" id="telefonoTrabajo" onblur="validar('telefonoTrabajo');" />
 </td>
  <td>
 <div id='divtelefonoTrabajo'></div>
  </td>
 </tr>
 <tr>
 <td>Direcci&oacute;n:</td>
 <td>
 <textarea class="form-control" name="direccion" id="direccion" onblur="validar('direccion');" cols="10" rows="6">
 </textarea>
 </td>
 <td>
 <div id='divdireccion'></div>
 </td>
 </tr>
 <tr>
 <td>E-mail:</td>
 <td>
 <input type="text" class="form-control" name="email" id="email" onblur="validar('email');" />
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
</div>
<div style="clear: both;"></div>
<script type="text/javascript" src="<%=ruta%>/js/validacion.js"></script>
<%@include file="../administracion/footer.jsp"%> 