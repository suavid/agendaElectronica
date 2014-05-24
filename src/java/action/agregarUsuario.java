/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package action;

import conexion.conexion;
import utilidades.md5;
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
 * @author jorge
 */
@WebServlet(name = "agregarUsuario", urlPatterns = {"/agregarUsuario"})
public class agregarUsuario extends HttpServlet {

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
            throws ServletException, IOException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           // tomando valores del objeto request
            
            String nombre,apellido,usuario,pass,pass2,telefono,tipoUsuario;
            conexion con = null;
                        
            nombre = request.getParameter("nombre");
            apellido = request.getParameter("apellido");
            usuario = request.getParameter("usuario");
            pass = request.getParameter("pass");
            pass2 = request.getParameter("pass2");
            tipoUsuario = request.getParameter("tipoUsuario");
            telefono = request.getParameter("telefono");
           
            // encriptar pass a MD5
            md5 encp = new md5();
            String passMD5 = encp.ConvertirMD5(pass);
            
            TreeMap<String, String>datos = new TreeMap<String,String>();
            //llenando TreeMap
            datos.put("nombres", nombre);
            datos.put("apellidos", apellido);
            datos.put("username", usuario);
            datos.put("password",passMD5);
            datos.put("telefonoMovil",telefono);
            datos.put("tipoUsuario",tipoUsuario);
            
            // realizar insercion
            con = new conexion();
            String resultado = con.insertQuery(datos, "usuarios");
            
            response.sendRedirect("/agendaElectronica/usuarios/AgregarUsuario.jsp?" + resultado);
            
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
            Logger.getLogger(agregarUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(agregarUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
