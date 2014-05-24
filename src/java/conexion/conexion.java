/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

/**
 *
 * @author Pochii
 */
import java.sql.*;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class conexion {
    public ResultSet rs = null;
    public Connection con = null;
    public Statement s = null;
    public PreparedStatement so = null;
    
   public conexion() throws SQLException
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agenda","root","123456");
            s = con.createStatement();
                        
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
   /**
    * 
    * @param  datos Mapa que contiene los <campos, valores> a insertar en la table
    * @param  tabla nombre de la tabla en la cual se insertara
    * @return String mensaje. exito=in en el caso de insercion exitosa, erno=1 en el caso de error
    * @throws SQLException 
    */
   public String insertQuery(TreeMap<String, String>datos, String tabla) throws SQLException
    {
        String campos   = "INSERT INTO " + tabla + "(";
        String valores  = " values(";
        int    cont     = 1;
                 
        for(String param : datos.keySet())
        {
            if(cont  < datos.size())
            {
                campos  += param + ",";
                valores += "?,";
            }
            else
            {
                campos  += param + ")";
                valores += "?)";
            }  
            cont++;
        }
        campos += valores;
        so = con.prepareStatement(campos);
        int i = 1;
        
        for(String param : datos.keySet())
        {
           so.setString(i, datos.get(param));
           i++;
        }
        
        try{
            so.executeUpdate();
        }
        catch(Exception e){
            System.out.println("No pude insertar debido a: " + e.getMessage());
            return "erno=1&error=" + e.getMessage();
        }
        return "exito=in";
    } 
    /**
    * 
    * @param datos Mapa que contiene los <campos, valores> a modificar en la tabla
    * @param tabla nombre de la tabla en la cual se insertara
    * @param condicion, query que especifica la condicion que debe cumplirse en la consulta
    * @return String mensaje. exito=in en el caso de insercion exitosa, erno=1 en el caso de error
    * @throws SQLException 
    */
    public String updateQuery(TreeMap<String, String>datos, String tabla, String condicion) throws SQLException
    {
        String campos   = "UPDATE " + tabla + " SET ";
        int    cont     = 1;
        for(String param : datos.keySet())
        {
            if(cont  < datos.size())
                campos  += param + "= ?,";
            else
                campos  += param + "= ? ";
            cont++;
        }
        /**Agregando condicion***/
        if(!condicion.equals("")){
            campos +="WHERE " + condicion;
        }
        so = con.prepareStatement(campos);
        int i = 1;
        
        for(String param : datos.keySet())
        {
           so.setString(i, datos.get(param));
           i++;
        }
        try{
            so.executeUpdate();
        }
        catch(Exception e){
            System.out.println("No pude actualizar debido a: " + e.getMessage());
            return "erno=1&error=" + e.getMessage();
        }
        return "exito=up";
    } 
    /**
    * @param query Consulta a realizar en la base de datos
    */
    public void setRS(String query) 
    {
        try {
            rs = s.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    /**
     * @return ResultSet, resultado de la consulta que almacena el RS
     */
    public ResultSet getRs()
    {
        if (rs != null)
        {
            return rs;
        }
        else
            return null;
    }
    
    public boolean actualizar(String query) throws SQLException
    {
        try{
        s.executeUpdate(query);
        return true;
        }
        catch (Exception e)
        {
            return false;
        }   
    }
    public void cerrarConexion() throws SQLException
    {
        con.close();
    }
}
