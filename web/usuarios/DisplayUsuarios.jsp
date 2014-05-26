<%-- 
    Document   : DisplayUsuarios
    Created on : 04-07-2014, 07:45:13 PM
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style media="all" type="text/css" >
    @import url("../css/displaytag.css");
</style>

        <%
            String criterio; 
            criterio = request.getParameter("criterio"); 
            if(criterio != null)
             {   
          %>


            <sql:query var="q1" dataSource="jdbc/mysql">
                select * from usuarios where concat(nombres, ' ', apellidos) like '%<%=criterio%>%' 
            </sql:query>

                <display:table id="usuarios" class="table-responsive" name="${q1.rows}" pagesize="15">
                <display:column title="Nombre" property="nombres" />
                <display:column title="Apellido" property="apellidos" />
                <display:column title="Usuario" property="username" />
                <display:column title="Tipo Usuario" property="tipoUsuario" />
                <display:column  value="Modificar"  url="/usuarios/ModificarUsuario.jsp?type=d" paramId="idUsuario"
                 paramProperty="idUsuario"   style="text-align:center;"/>
                <display:column  value="Eliminar"  url="/usuarios/EliminarUsuario.jsp" paramId="id"
                 paramProperty="idUsuario"   style="text-align:center;"/>
            </display:table> 
    <%
             }
            else 
            {
                %>
                 <sql:query var="q1" dataSource="jdbc/mysql">
                    select * from usuarios where concat(nombres, ' ', apellidos) like '<%=criterio%>'
                 </sql:query>

                <display:table id="usuarios" name="${q1.rows}" pagesize="15">
                    <display:column title="Nombre" property="nombres" />
                    <display:column title="Apellido" property="apellidos" />
                    <display:column title="Usuario" property="username" />
                    <display:column title="Tipo Usuario" property="tipoUsuario" />
                    <display:column  value="Modificar"  url="/usuarios/ModificarUsuario.jsp?type=d" paramId="idUsuario"
                 paramProperty="idUsuario"   style="text-align:center;"/>
                    <display:column  value="Eliminar"
                                     url="/usuarios/EliminarUsuario.jsp" paramId="id"
                                     paramProperty="idUsuario"  style="text-align:center;"/>

                </display:table> 
                
                <%
            }
            
    %>
