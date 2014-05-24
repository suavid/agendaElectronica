/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import conexion.conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Pochii
 */
@WebServlet(name = "agregarContacto", urlPatterns = {"/agregarContacto"})
public class agregarContacto extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String nombres, apellidos, telefonoMovil, telefonoTrabajo, direccion, email, idUsuario;
            String []requeridos = {"nombres", "idUsuario", "telefonoMovil"}; //Array con campos obligatorios
            
            TreeMap<String, String>datos = new TreeMap<String, String>();

            datos.put("nombres",request.getParameter("nombres"));
            datos.put("apellidos",request.getParameter("apellidos"));
            datos.put("telefonoMovil",request.getParameter("telefonoMovil"));
            datos.put("telefonoTrabajo",request.getParameter("telefonoTrabajo"));
            datos.put("direccion",request.getParameter("direccion"));
            datos.put("email",request.getParameter("email"));
            datos.put("idUsuario",request.getParameter("idUsuario"));
            
            conexion con = new conexion();
            String resultado = con.insertQuery(datos, "contacto");
            con.cerrarConexion();
            response.sendRedirect("/agendaElectronica/contactos/MostrarContactos.jsp?" + resultado);
            
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(agregarContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(agregarContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
