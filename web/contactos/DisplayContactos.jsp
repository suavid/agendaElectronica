<%-- 
    Document   : DisplayUsuarios
    Created on : 04-07-2014, 07:45:13 PM
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style media="all" type="text/css" >
    @import url("../css/displaytag.css");
</style>

        <%
            HttpSession SessionActual = request.getSession();
            
            String criterio; 
            criterio = request.getParameter("criterio"); 
            if(criterio != null)
             {   
          %>


            <sql:query var="q1" dataSource="jdbc/mysql">
                select * from contacto where concat(nombres, ' ', apellidos) like '%<%=criterio%>%' and 
                idUsuario=<%= SessionActual.getAttribute("idUsuario") %>
            </sql:query>

            <display:table id="contactos" class="table-responsive" name="${q1.rows}" pagesize="15">
                <display:column title="Nombre" property="nombres" />
                <display:column title="Apellido" property="apellidos" />
                <display:column title="Telefono" property="TelefonoMovil" />
                <display:column title="Email" property="email" />
                
                 <display:column  value="Modificar"
                                 url="/contactos/ModificarContacto.jsp" paramId="id"
                                 paramProperty="idContacto"  style="text-align:center;"/>
                  
                 <display:column  style="text-align:center;">
                     <a onclick="confirmar('/agendaElectronica/eliminarContacto',${usuarios.idContacto})">Eliminar</a>
                 </display:column>
            
            </display:table> 
    <%
             }
            else 
            {
                %>
                  <sql:query var="q1" dataSource="jdbc/mysql">
                select * from contacto where idUsuario=<%= SessionActual.getAttribute("idUsuario") %>
            </sql:query>

            <display:table id="usuarios" name="${q1.rows}" pagesize="15">
                <display:column title="Nombre" property="nombres" />
                <display:column title="Apellido" property="apellidos" />
                <display:column title="Telefono" property="TelefonoMovil" />
                <display:column title="Email" property="email" />
                
                 <display:column  value="Modificar"
                                 url="/contactos/ModificarContacto.jsp" paramId="id"
                                 paramProperty="idContacto"  style="text-align:center;"/>
                 
                 <display:column  style="text-align:center;">
                     <a onclick="confirmar('/agendaElectronica/eliminarContacto',${usuarios.idContacto})">Eliminar </a>
                 </display:column>
                
            </display:table> 
                
                <%
            }
            
    %>
