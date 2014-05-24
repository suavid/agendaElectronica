/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package action;

import conexion.conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import utilidades.md5;

/**
 *
 * @author jorge
 */
@WebServlet(name = "procesarLogueo", urlPatterns = {"/procesarLogueo"})
public class procesarLogueo extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            // procesar datos
            String usuario = request.getParameter("usuario");
            String pass = request.getParameter("pass");
            md5 enpmd5 = new md5();
            String passMD5 = enpmd5.ConvertirMD5(pass);
            String qr ="select * from usuarios where username='"+ usuario +"' and password='"+passMD5+"'";
            conexion con = new conexion();
            con.setRS(qr);
            ResultSet rs = (ResultSet) con.getRs();
            if (rs.next())
            {
                HttpSession SessionActual = request.getSession(true);
                // almacenando valores en la session
                SessionActual.setAttribute("idUsuario", rs.getString("idUsuario"));
                SessionActual.setAttribute("tipoUsuario", rs.getString("tipoUsuario"));
                SessionActual.setAttribute("nombreUsuario", rs.getString("nombres") + " " + rs.getString("apellidos"));
                
                response.sendRedirect("/agendaElectronica/contactos/MostrarContactos.jsp");
            }
            else 
            {
                response.sendRedirect("/agendaElectronica/login.jsp?erno=12");
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
        } catch (Exception ex) {
            Logger.getLogger(procesarLogueo.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (Exception ex) {
            Logger.getLogger(procesarLogueo.class.getName()).log(Level.SEVERE, null, ex);
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
