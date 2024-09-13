/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuario;

/**
 *
 * @author Fede
 */
public class Data {
    
    String password,username,nombre,apellido, dni,telefono;
    
    public void setUsername( String value )
    {
        username = value;
    }

    public void setPassword( String value )
    {
        password = value;
    }
    
    public void setNombre( String value )
    {
        nombre = value;
    }
    
    public void setApellido( String value )
    {
        apellido = value;
    }
    
    public void setDni( String value )
    {
        dni = value;
    }
    
    public void setTel( String value )
    {
        telefono = value;
    }
    
    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public String getNombre()   { return nombre; }
    public String getApellido() { return apellido; }
    public String getDni()      { return dni; }
    public String getTel()      { return telefono; }
    
}
