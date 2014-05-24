/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package action;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import conexion.conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author jorge
 */
@WebServlet(name = "eliminarUsuario", urlPatterns = {"/eliminarUsuario"})
public class eliminarUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
           
            String id = request.getParameter("id");
            HttpSession SessionActual = request.getSession();
            String idUsuarioActual = SessionActual.getAttribute("idUsuario").toString();
            
            String qr ="select idUsuario from usuarios where idUsuario=" + id;
            conexion con = new conexion();
            con.setRS(qr);
            ResultSet rs = (ResultSet) con.getRs();
            rs.next();
            String username = rs.getString("idUsuario").toString();
            if (username.equals(idUsuarioActual))
            {
                response.sendRedirect("/agendaElectronica/usuarios/EliminarUsuario.jsp?erno=10" );
            }
            else{
                // eliminando contactos del usuario
                qr ="delete from contacto where idUsuario=" + id;

                con.actualizar(qr);

                qr ="delete from usuarios where idUsuario=" + id;
                boolean estado = con.actualizar(qr);
                String resultado ="";
                if (estado)
                    resultado = "exito=del";
                else
                    resultado ="erno=1";

                response.sendRedirect("/agendaElectronica/usuarios/EliminarUsuario.jsp?" + resultado);
               
            }
            
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
            Logger.getLogger(eliminarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
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
            Logger.getLogger(eliminarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
