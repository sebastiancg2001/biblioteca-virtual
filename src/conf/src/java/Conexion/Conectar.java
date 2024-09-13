/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package Conexion;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Fede
 */
public class Conectar { 
    Connection conexion;
    Statement consulta;
    private static final Boolean DEBUG = true;
    public String Conectar()
    {
        String resp;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conexion=DriverManager.getConnection("jdbc:mysql://localhost/biblioteca","biblioteca","root");
            //out.println("Conexión realizada con éxito a: "+conexion.getCatalog());
            //conexion.close();
            resp = "OK";
            } 
        catch(SQLException ex)
        {   
            debug("sqlexception: "+ex.getMessage());
            resp = "Se produjo una excepción durante la conexión:"+ex;
        } 
        catch(Exception ex){ 
            debug("generalException: "+ex.getMessage());
            resp = "Se produjo una excepción:"+ex;
        }
        return resp;
    }
    private void debug(String message){
        if(DEBUG){
            System.out.println("DEBUG: "+message );
        }
    }

    public void Desconectar()
    {
        try {
            conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(Conectar.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public Statement Consulta()
    {
        try {
            consulta = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        } catch (SQLException ex) {
            Logger.getLogger(Conectar.class.getName()).log(Level.SEVERE, null, ex);
        }
        return consulta;
    }
}
