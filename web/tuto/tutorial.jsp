<%@include file="../administracion/header.jsp" %>
<div class="unico">
    <div id="first" class="details">
        <p class="summary" onclick="ver('uno')" >¿Donde veo mis datos?,¿Los puedo modificar?</p>
        <p class="oculto" id="uno" >
            <br />Encontrar&aacute; la informaci&oacute;n de su cuenta en el men&uacute; principal, en la sección "Mi cuenta". Para realizar modificaciones
            encontrar&aacute; un bot&oacute;n  
            Siga el siguiente link para llegar de forma directa
            <a  class="link" href="../index.jsp"> -> Mi Perfil </a>
        <img class="img_c" src="../img/ej5.png" width="300" height="250" alt="cuenta" />
        </p>
    </div>    
    <div class="details">
        <p class="summary" onclick="ver('dos')">¿Cómo agregar nuevo contacto?</p>
        <p class="oculto" id="dos"><br />            
            Para agregar nuevo contacto es necesario buscar en el men&uacute; "Contactos", una vez en dicha p&aacute;gina, presiona el bot&oacute;n azul,
            localizado en la esquina inferior izquierda, con el texto "Agregar nuevo",
            una vez ah&iacute; se debe de llenar  todos datos solicitados mediante un asterisco 
            ya que estos son obligatorios. Siga el siguiente link para llegar de forma directa
            <a  class="link" href="../contactos/AgregarContacto.jsp"> -> Agregar Contacto </a>
        </p></div> 
    <div class="details">
        <p class="summary" onclick="ver('tres')">¿C&oacute;mo buscar un contacto existente</p>
        <p class="oculto" id="tres"><br />
          Buscar un contacto existente es necesario buscar en el men&uacute; "Contactos", 
          ya en dicha pagina, introducir framentos del nombre o apellido del contacto a buscar en el campo que dice "Buscar Contactos".
          Esta opci&oacute;n es de mucha utilidad al existir muchos contactos, ejemplo: <br />
          <br />Contactos sin ingresar busqueda <br />
          <img class="img_c" src="../img/ej1.png" width="500" height="250" alt="Sin realizar busqueda" />
          <br />Contactos con busqueda<br />
            <img class="img_c" src="../img/ej2.png" width="500" height="250" alt="realizar busqueda" /> 
           </p></div>
   <div class="details">
        <p class="summary" onclick="ver('cuat')">¿Cómo modificar un contacto?</p>
        <p class="oculto" id="cuat">
            <br />
            Para modificar un contacto existente, se debe dirigir a la sección de contactos, ubicamos al contacto que desea 
            realizar  la modificación (para facilitar esta acción puede hacer uso de buscar) ,  una vez ubicado simplemente
            selecciona el vínculo "modificar", con lo cual se presentara toda la información del contacto, 
            al terminar de realizar los cambios debe presionar "guardar contacto"
            <img class="img_c" src="../img/ej3.png" width="500" height="250" alt="modificar" />
        </p>
    </div>
    <div class="details">
        <p class="summary" onclick="ver('cinco')">¿Cómo eliminar un contacto?</p>
        <p class="oculto" id="cinco">
             <br />
             Para eliminar un contacto existente, se debe dirigir a la sección de contactos, ubicamos al contacto que desea 
             realizar  la modificación (para facilitar esta acción puede hacer uso de buscar) ,  una vez ubicado simplemente
             selecciona el vínculo "eliminar", con lo cual se pedira confirmaci&oacute;n
             <img class="img_c" src="../img/ej4.png" width="500" height="250" alt="modificar" />
         </p>
    </div>
<%
    String tu = (String) SessionActual.getAttribute("tipoUsuario");
    if (tu.equals("Administrador"))
    {
        %>
        <div class="details">
            <p class="summary" onclick="ver('seis')">¿C&oacute;mo administrar los usuarios del sistema?</p>
            <p class="oculto" id="seis"><br />
            Para poder administrar los usuarios existentes en el sistema es necesario, acceder como administrador del sistema
            , pasado este paso se debe dirigir a la zona de usuarios, localizada en la barra de navegaci&oacute;n "Usuarios", en la nueva
            p&aacute;gina se puede crear, buscar, modificar y eliminar usuarios del sistema.Siga el siguiente link para llegar de forma directa
            <a  class="link" href="../usuarios/MostrarUsuarios.jsp"> -> Administrar Usuarios </a>
            <img class="img_c" src="../img/ej6.png" width="500" height="250" alt="modificar" />
            </p>
        </div>
        <%
    }
    %>
  <div class="details">
        <p class="summary" onclick="ver('siete')">Video Demostrativo</p>
         <div class="contenedorVideo" id="siete">
        <object type="application/x-shockwave-flash" data="http://www.youtube.com/v/1lwinEfhL78?color2=FBE9EC&amp;version=3">
            <param name="movie" value="http://www.youtube.com/v/1lwinEfhL78?color2=FBE9EC&amp;version=3" />
            <param name="allowFullScreen" value="true" />
            <param name="allowscriptaccess" value="always" />
        </object>
           
        </div>
    </div>
 </div>
<div class="clear-both"></div>
<script type="text/javascript" src="../js/validacion.js"></script>
<%@include file="../administracion/footer.jsp"%> 