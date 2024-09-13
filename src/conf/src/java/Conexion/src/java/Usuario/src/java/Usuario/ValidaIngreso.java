/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuario;

import Conexion.Conectar;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Fede
 */
public class ValidaIngreso {


    public int Ingreso(Data user)
    {
       String usu = user.getUsername();
       String pass = user.getPassword();
        
        Conectar conn = new Conectar();
        String resp = conn.Conectar();

        if (resp.equals("OK"))
        {
            Statement consulta = conn.Consulta();
            String sql = "SELECT * FROM personas WHERE usuario = '" + usu + "' AND password='"+ pass +"'";
            ResultSet rs;
            try {
                rs = consulta.executeQuery(sql);
                boolean tiene = rs.next();
                
                if(tiene==true)
                {
                    user.setNombre(rs.getString("nombre"));
                    user.setApellido(rs.getString("apellido"));
                    user.setDni(Long.toString(rs.getLong("dni")));
                    user.setTel(Long.toString(rs.getLong("telefono")));
                    conn.Desconectar(); 
                    return 0;
                }
                else
                {
                    user.setUsername(null);
                    user.setPassword(null);
                    conn.Desconectar(); 
                    return 1;
                }
            } catch (SQLException ex) {
                Logger.getLogger(ValidaIngreso.class.getName()).log(Level.SEVERE, null, ex);
                conn.Desconectar(); 
                user.setUsername(null);
                user.setPassword(null);
                return 2;
             }    
        }
        else
        {
            user.setUsername(null);
            user.setPassword(null);
            return 3;
        }
    }
}
