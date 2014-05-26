<%@include file="../administracion/header.jsp" %>
<div class="unico">
<details id="first">
   <summary>¿Donde veo mis datos?,¿Los puedo modificar?</summary>
   <p><br />
       Encontrar&aacute; la informaci&oacute;n de su cuenta en el men&uacute; principal, en la sección "Mi cuenta". Para realizar modificaciones
       encontrar&aacute; un bot&oacute;n  
       
       Siga el siguiente link para llegar de forma directa
       <a  class="link" href="<%=ruta%>/index.jsp"> -> Mi Perfil </a>
   </p>
   <br /> 
   <img class="img_c" src="<%=ruta%>/img/ej5.png" style="max-width:100%;" alt="cuenta">
   
    <br />
</details>    
    
<details>
   <summary>¿Cómo agregar nuevo contacto?</summary>
   <p><br />Para agregar nuevo contacto es necesario buscar en el men&uacute; "Contactos", una vez en dicha p&aacute;gina, presiona el bot&oacute;n azul,
       localizado en la esquina inferior izquierda, con el texto "Agregar nuevo",
       una vez ah&iacute; se debe de llenar  todos datos solicitados mediante un asterisco 
       ya que estos son obligatorios. Siga el siguiente link para llegar de forma directa
       <a  class="link" href="<%=ruta%>/contactos/AgregarContacto.jsp"> -> Agregar Contacto </a>
   </p>
   <br />    
</details>
    
    
<details>
    <summary>¿C&oacute;mo buscar un contacto existente</summary>
    <p>
        <br />Buscar un contacto existente es necesario buscar en el men&uacute; "Contactos", 
      ya en dicha pagina, introducir framentos del nombre o apellido del contacto a buscar en el campo que dice "Buscar Contactos".
      Esta opci&oacute;n es de mucha utilidad al existir muchos contactos, ejemplo: <br />
    </p>
 
  <div class="center">
        <p>Contactos sin ingresar busqueda</p>
        <img class="img_c" src="<%=ruta%>/img/ej1.png" style="max-width:100%;" alt="Sin realizar busqueda">
        <p>Contactos con busqueda</p>
        <img class="img_c" src="<%=ruta%>/img/ej2.png" style="max-width:100%;" alt="realizar busqueda"> 
  </div>
</details>
    
<details>
   <summary>¿Cómo modificar un contacto?</summary>
   <p><br />
       Para modificar un contacto existente, se debe dirigir a la sección de contactos, ubicamos al contacto que desea 
       realizar  la modificación (para facilitar esta acción puede hacer uso de buscar) ,  una vez ubicado simplemente
       selecciona el vínculo "modificar", con lo cual se presentara toda la información del contacto, 
       al terminar de realizar los cambios debe presionar "guardar contacto"
       
       <img class="img_c" src="<%=ruta%>/img/ej3.png" style="max-width:100%;" alt="modificar">
    </p>
</details>
    
<details>
   <summary>¿Cómo eliminar un contacto?</summary>
   <p><br />
       Para eliminar un contacto existente, se debe dirigir a la sección de contactos, ubicamos al contacto que desea 
       realizar  la modificación (para facilitar esta acción puede hacer uso de buscar) ,  una vez ubicado simplemente
       selecciona el vínculo "eliminar", con lo cual se pedira confirmaci&oacute;n
       
       <img class="img_c" src="<%=ruta%>/img/ej4.png" style="max-width:100%;" alt="modificar">
    </p>
</details>
    
<!-- administrador -->
<%
    String tu = (String) SessionActual.getAttribute("tipoUsuario");
    if (tu.equals("Administrador"))
    {
        %>
        <details>
            <summary>¿C&oacute;mo administrar los usuarios del sistema?</summary>
   <p><br />
       Para poder administrar los usuarios existentes en el sistema es necesario, acceder como administrador del sistema
       , pasado este paso se debe dirigir a la zona de usuarios, localizada en la barra de navegaci&oacute;n "Usuarios", en la nueva
       p&aacute;gina se puede crear, buscar, modificar y eliminar usuarios del sistema.Siga el siguiente link para llegar de forma directa
       <a  class="link" href="<%=ruta%>/usuarios/MostrarUsuarios.jsp"> -> Administrar Usuarios </a></p><br />
       
       
    <img class="img_c" src="<%=ruta%>/img/ej6.png" style="max-width:100%;" alt="modificar">
    <br />
</details>
        <%
    }
    %>
</div>
<div style="clear: both;"></div>
<script src="<%=ruta%>/js/validacion.js"></script>

<%@include file="../administracion/footer.jsp"%> 