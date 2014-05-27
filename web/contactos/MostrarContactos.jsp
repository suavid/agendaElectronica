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
        window.onload  = function() { 
            buscarUsuario('DisplayContactos.jsp', 'txtNombre','busqueda'); 
            document.getElementById("optDrawer").addEventListener("click", displayMenu ,false);
        };
    })();
</script>
<div class="unico">

<h2 id='moduleTitle'>.:: Mis Contactos::. </h2>    
Buscar contacto:
<input type='text' name='txtNombre' id='txtNombre' class='form-control' onkeyup="buscarUsuario('DisplayContactos.jsp', 'txtNombre','busqueda');" />
        <div id="busqueda" class="center-content">
        </div>
        <br />
    <a href="AgregarContacto.jsp" class="btn btn-principal">Agregar nuevo</a>

</div> 
 
<div class="clear-both"></div>
<script type="text/javascript">
    function confirmar(url,id){
        if(confirm("Eliminar este contacto?"))
            location.href = url + "?idContacto=" + id;
        else
            alert("Cancelado!");
    }
</script>
<%@include  file="../administracion/footer.jsp" %>

