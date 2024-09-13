<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Conexion.Conectar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="Usuario.Data" scope="session"/>
<jsp:setProperty name="user" property="*"/>
<jsp:useBean id="valida" class="Usuario.ValidaIngreso" scope="session"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
    
    int resp = valida.Ingreso(user);
    
    switch(resp)
    {
        case 0:
            %>
                <script>location = 'index.jsp';</script>
            <%
            break;
        case 1:
            %>
                <script>alert('Usuario y/o contraseña incorrectos');location = 'index.jsp'</script>
            <%
            break;
        case 2:
            %>
                <script>alert('Error de conexion');location = 'index.jsp'</script>
            <%
            break;
        case 3:
            %>
                <script>alert('Error de conexion num: 8749');location = 'index.jsp'</script>
            <%
            break;
    }
    
%>
    </body>
</html>
