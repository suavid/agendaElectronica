<%-- 
    Document   : MostrarUsuarios
    Created on : 04-07-2014, 03:43:28 PM
    Author     : jorge
--%>
<%@include  file="../administracion/header.jsp" %>
<%@include  file="../administracion/valTipoUsuario.jsp" %>

<script type="text/javascript" src="../js/selectAjax.js"></script>
<body onload="buscarUsuario('DisplayUsuarios.jsp', 'txtNombre','busqueda')">
<div class="unico">
    <h2 id="moduleTitle">.:: Usuarios en el sistema ::. </h2>    
    <br /><br />
    <input  style="margin-left: 84px;" type='text' name='txtNombre' id='txtNombre' class='form-control' placeholder="Buscar Usuarios"  onkeyup="buscarUsuario('DisplayUsuarios.jsp', 'txtNombre','busqueda');" />
    <br /><br />
    <center>
        <div id="busqueda">
        </div>
   </center>
   <br />
   <a href="AgregarUsuario.jsp" class="btn btn-principal">Agregar nuevo</a>
</div> 
<div style="clear: both;"></div>
<%@include  file="../administracion/footer.jsp" %>

