<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Conexion.Conectar"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="Usuario.Data" scope="session"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>

<style>
#TablaResultados tr:nth-child(odd) {
   background-color: #FFC;
   color:#777
}

#TablaResultados tr:nth-child(even) {
   background-color: #FC9;
   color:#777;
}
</style>
<link href="estilo.css" rel="stylesheet" type="text/css" />
<script>
    function Elimina(url)
    {
        if(confirm("Está seguro que quiere eliminar la reserva?"))
        {
            location = url; 
        }
    }
</script>
</head>

<body>

<div class="container">
  <div class="header" align="center">
  	<h1 style="padding-top:10px; margin-bottom:-5px">Biblioteca Virtual</h1>
        Sistema Online de Reserva de Libros
  </div>
  <div class="sidebar1" align="center">
    <%
    String usu=user.getUsername();
              
    if (usu==null)
    {    
    %>
    <script>location='index.jsp';</script>
    <%
    }
    else
    {
    %>
    <ul class="nav2">
      <li><a href="index.jsp">Buscar Libros <img src="lupa_b.png" width="20" height="20" style="margin-bottom:-5px"></a></li>
      <li><a href="ModificarDatos.jsp">Modificar mis datos <img src="lapiz.png" height="22" style="margin-bottom:-5px"></a></li>
      <li><a href="CierreSesion.jsp">Cerrar Sesi&oacute;n: <b><%=user.getUsername()%></b></a></li>
    </ul>
    <%
    }
    %>
  </div>
  <div class="content" align="center">
      <table id="TablaResultados" width="90%" border="0" cellpadding="0">
      <tr>
          <td colspan="6"align="center" bgcolor="#252f4e" style="padding-top: 20px; color: #ffffff"><h3>Mis Reservas</h3></td>
      </tr>
      <tr>
        <td width="8%" align="center" bgcolor="#252f4e" style="color:#ffffff">Num.</td>
        <td width="24%" align="center" bgcolor="#252f4e" style="color:#ffffff">T&iacute;tulo</td>
        <td width="24%" align="center" bgcolor="#252f4e" style="color:#ffffff">Autor</td>
        <td width="17%" align="center" bgcolor="#252f4e" style="color:#ffffff">F.Desde</td>
        <td width="17%" align="center" bgcolor="#252f4e" style="color:#ffffff">F.Hasta</td>
        <td width="10%" align="center" bgcolor="#252f4e" style="color:#ffffff">&nbsp;</td>
      </tr>
<%
    Conectar conn = new Conectar();
    String resp = conn.Conectar();

       if (resp.equals("OK"))
       {
           Statement consulta = conn.Consulta();
           String sql="SELECT * FROM reservas r, libros l WHERE r.isbn=l.isbn AND usuario='"+usu+"'";
           ResultSet rs=consulta.executeQuery(sql);

           int i=1;
           //Date hoy = new Date();
           java.util.Calendar cal = java.util.Calendar.getInstance();
           java.util.Date utilDate = cal.getTime();
           java.sql.Date hoy = new Date(utilDate.getTime());
           
           while(rs.next())
           {
             %>
             <tr>
                <td align="center"> <%=i%></td>
                <td align="center"> <%=rs.getString("titulo")%></td>
                <td align="center"> <%=rs.getString("autor")%></td>
                <td align="center"> <%=rs.getDate("fecha_desde")%></td>
                <td align="center"> <%=rs.getDate("fecha_hasta")%></td>
                <td align="center">
                    <%
                    //int comparaFecha = hoy.compareTo(rs.getDate("fecha_hasta"));
                    if(hoy.before(rs.getDate("fecha_hasta")))
                    {
                        %>
                        <a onClick="Elimina('EliminarReserva.jsp?isbn=<%=rs.getString("isbn")%>')" style=" cursor: pointer;">Eliminar</a>
                        <%
                    }
                    else
                    {
                        out.print("Finalizado");
                    }
                    %>
                </td>
             </tr>
             <%
             i++;
           }
       }
%>
      
      
    </table>
  </div>
  <div class="footer" align="center">
    <span style="font-size:10px"><b>Trabajo Final Java - UTN - FRRO</b><br />
    Alvarez, Federico - Muccini, Ver&oacute;nica</span>
  </div>
</div>
</body>
</html>
