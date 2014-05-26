<%-- 
    Document   : MostrarUsuarios
    Created on : 04-07-2014, 03:43:28 PM
    Author     : jorge
--%>

<%@include  file="../administracion/header.jsp" %>
<%@include  file="../administracion/valTipoUsuario.jsp" %>
<script type="text/javascript" src="../js/selectAjax.js"></script>

<script>
    (function(){
        window.onload  = function() { buscarUsuario('DisplayContactos.jsp', 'txtNombre','busqueda'); };
    })();
</script>
<div class="unico">

<h2 id='moduleTitle'>.:: Mis Contactos::. </h2>    
<input type='text' name='txtNombre' id='txtNombre' class='form-control' placeholder="Buscar Contactos"  onkeyup="buscarUsuario('DisplayContactos.jsp', 'txtNombre','busqueda');" />
        <div id="busqueda" class="center-content table-responsive">
        </div>
        <br />
    <a href="AgregarContacto.jsp" class="btn btn-principal">Agregar nuevo</a>

</div> 
 
<div style="clear: both;"></div>
<script>
    function confirmar(url,id){
        if(confirm("Eliminar este contacto?"))
            location.href = url + "?idContacto=" + id;
        else
            alert("Cancelado!");
    }
</script>
<%@include  file="../administracion/footer.jsp" %>

