<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Conexion.Conectar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="Usuario.Data" scope="session"/>
<jsp:setProperty name="user" property="*"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="estilo.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
         Conectar conn = new Conectar();
         String resp = conn.Conectar();
        
         if (resp.equals("OK"))
         {
          String usu=user.getUsername();
          String libro=request.getParameter("isbn");
          Statement consulta = conn.Consulta();
          String sql="DELETE FROM reservas WHERE usuario='"+usu+"' AND isbn='"+libro+"'";
           consulta.executeUpdate(sql);
           %>
              <script>alert("Reserva eliminada");location='MisReservas.jsp';</script>   
           <%
             
         }

        %>
    </body>
</html>
