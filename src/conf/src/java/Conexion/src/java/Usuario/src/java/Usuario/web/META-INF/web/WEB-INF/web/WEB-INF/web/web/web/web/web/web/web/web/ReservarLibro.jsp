<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Conexion.Conectar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="Usuario.Data" scope="session"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        
          <%
                
          String usu=user.getUsername();
              
           if (usu!=null)
           {
                 
             Conectar conn = new Conectar();
             String resp = conn.Conectar();
             String libro;
             if (resp.equals("OK"))
             {
                libro=request.getParameter("isbn");
                Statement consulta = conn.Consulta();
                String sql = "SELECT * FROM reservas WHERE isbn='" +libro+"' AND fecha_hasta>CURDATE()";
                ResultSet rs=consulta.executeQuery(sql);
               
                if(!rs.isBeforeFirst())
                {   
                   String q="INSERT INTO reservas(usuario,isbn,fecha_desde,fecha_hasta) VALUES ('"+usu+"','"+libro+"',CURDATE(),DATE_ADD(CURDATE(),INTERVAL 15 DAY)) ";
                   consulta.executeUpdate(q);
                    %>
                      <script>location='MisReservas.jsp';</script>   
                   <%
                }
                else
                {
                 %>
                 <script>alert("NO esta disponible");history.back();</script>   
                 <%
                }
             
             }else
             {
                 
             }
         }  
         else
         {
           %>
            <script>alert("Usted debe estar registrado para reservar libros");history.back();</script>   
           <%
         }
                     
            
      %> 
    </body>
</html>
