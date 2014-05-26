<%-- 
    Document   : MostrarUsuarios
    Created on : 04-07-2014, 03:43:28 PM
    Author     : jorge
--%>

<script type="text/javascript" src="../js/selectAjax.js"></script>
<%@include  file="../administracion/header.jsp" %>
<div class="unico">

<body onload="buscarUsuario('DisplayContactos.jsp', 'txtNombre','busqueda')">
<center>
    <h2>.:: Mis Contactos::. </h2>    
</center>
<br /><br />
<input type='text' name='txtNombre' id='txtNombre' class='form-control' placeholder="Buscar Contactos"  onkeyup="buscarUsuario('DisplayContactos.jsp', 'txtNombre','busqueda');" />
<br /><br />
    <center>
        <div id="busqueda">
        </div>
    </center>
    <br />
    <a href="AgregarContacto.jsp" class="btn btn-principal">Agregar nuevo</a>

</div> 
 
<div style="clear: both;"></div>
<script language="javascript">
    function confirmar(url,id){
        if(confirm("Eliminar este contacto?"))
            location.href = url + "?idContacto=" + id;
        else
            alert("Cancelado!");
    }
</script>
<%@include  file="../administracion/footer.jsp" %>

