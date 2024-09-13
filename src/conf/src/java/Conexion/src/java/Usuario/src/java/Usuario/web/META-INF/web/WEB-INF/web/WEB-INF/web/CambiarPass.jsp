<%-- 
    Document   : CambiarContraseña
    Created on : 05/06/2013, 19:00:18
    Author     : Vero
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Conexion.Conectar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="Usuario.Data" scope="session"/>
<%
  String pasVieja=request.getParameter("pasVieja");   
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <title>JSP Page</title>
                  
    </head>
    <body>
       
        
           
      <%
        String pass=user.getPassword();
        if(!pass.equals(pasVieja))
        {
            
           %>
              <script>alert("La contraseña anterior no coincide");location="CierreSesion.jsp";</script>   
           <%
     
        }
        else
        {
              Conectar conn = new Conectar();
              String resp = conn.Conectar();
              String dni=user.getDni();
              String password=request.getParameter("pasNueva");
              if (resp.equals("OK"))
              {                      
                  Statement consulta = conn.Consulta();
                  String sql= "UPDATE personas SET password='"+password+"' WHERE dni='"+dni+"'";
                  consulta.executeUpdate(sql);
                  user.setPassword(password);
                  //response.sendRedirect("index.jsp");
                  %>
                  <script>
                        alert('Pass modificada exitosamente!');
                        location = 'ModificarDatos.jsp';
                 </script>
                  <%
               }
            
        }
       
       %>
    </body>
</html>
