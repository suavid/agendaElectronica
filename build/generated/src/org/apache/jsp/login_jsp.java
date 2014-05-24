package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

  
    String ruta = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("<head>\n");
      out.write("\t<title>Agenda electr&oacute;nica UDB</title>\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"/agendaElectronica/css/estilo.css\" media=\"screen\" />\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"/agendaElectronica/css/estilo_login_responsive.css\" media=\"all\" />\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t<div id=\"contenido\">\t\n");
      out.write("\t\t<div id=\"header\">\n");
      out.write("\t\t\t<div id=\"logo\">\n");
      out.write("\t\t\t</div>\t\n");
      out.write("\t\t</div>\n");
      out.write("            <div> <!---INICIO DEL CONTENT--->\n");
      out.write("                <center>\n");
      out.write("                     <!--Alertas !--->\n");
      out.write("            ");

                  if (request.getParameter("erno") != null)
                  {
                      int error = Integer.parseInt(request.getParameter("erno"));
                      
                      switch (error)
                      {
                          case 10:
                            out.print(" <div class=\"alert alert-danger fade in\">"
                                      + "Debe autenticarse para ingresar al sistema</div>");
                            break;  
                          case 11:
                            out.print(" <div class=\"alert alert-danger fade in\">"
                                      + "No posee suficientes privilegios para entrar a esta opci&oacute;n</div>");
                            break;
                          case 12:
                              out.print(" <div class=\"alert alert-danger fade in\">"
                                      + "Usuario o contrase&ntilde;a incorrectos</div>");
                            break;
                      }
                      
                  }                  
         
      out.write("\n");
      out.write("                    <h1>Ingreso al sistema</h1>\n");
      out.write("\n");
      out.write("                    <form action=\"/agendaElectronica/procesarLogueo\" method=\"post\">\n");
      out.write("                    <table>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Usuario:</td>\n");
      out.write("                            <td><input type=\"text\" name=\"usuario\" required /> </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Contrase&ntilde;a:</td>\n");
      out.write("                            <td><input type=\"password\" name=\"pass\" required /> </td>\n");
      out.write("                        </tr>\n");
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td colspan=\"2\">\n");
      out.write("                                <center><br />\n");
      out.write("                                    <input type=\"Reset\" class=\"btn btn-principal\" value=\"Limpiar\" />\n");
      out.write("                                    <input type=\"Submit\" class=\"btn btn-principal\" value=\"Ingresar\" />\n");
      out.write("                                </center>\n");
      out.write("                            </td>\n");
      out.write("\n");
      out.write("                        </tr>\n");
      out.write("                   </table>\n");
      out.write("                        <br /><br />\n");
      out.write("                  </form>\n");
      out.write("                </center>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
