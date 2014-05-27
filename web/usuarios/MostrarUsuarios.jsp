<%-- 
    Document   : MostrarUsuarios
    Created on : 04-07-2014, 03:43:28 PM
    Author     : jorge
--%>
<%@include  file="../administracion/header.jsp" %>
<%@include  file="../administracion/valTipoUsuario.jsp" %>

<script type="text/javascript" src="../js/selectAjax.js"></script>
<script type="text/javascript">
    (function(){
        window.onload  = function() { buscarUsuario('DisplayUsuarios.jsp', 'txtNombre','busqueda'); };
        document.getElementById("optDrawer").addEventListener("click", displayMenu ,false);
    })();
</script>
<div class="unico">
    <h2 id="moduleTitle">Usuarios en el sistema</h2>    
    Buscar usuarios: <input type='text' name='txtNombre' id='txtNombre' class='form-control' onkeyup="buscarUsuario('DisplayUsuarios.jsp', 'txtNombre','busqueda');" />
   <div id="busqueda" class="center-content">
   </div>
   <br />
   <a href="AgregarUsuario.jsp" class="btn btn-principal">Agregar nuevo</a>
</div> 
<div style="clear: both;"></div>
<%@include  file="../administracion/footer.jsp" %>

