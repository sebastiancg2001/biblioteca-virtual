<%@page import="java.sql.ResultSet"%>
<%@page import="Conexion.Conectar"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="Usuario.Data" scope="session"/>
<%
    boolean busca = false;
    String libr = " ";
    if(request.getParameter("isbn")!=null)
     {
         busca = true;
         libr=request.getParameter("isbn");
     }
              
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ver Libro</title>
<link href="estilo.css" rel="stylesheet" type="text/css" />
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
    <form action="Validar.jsp" method="post" onsubmit="return ValidarI()">
    <ul class="nav">
      <li>Usuario:<br /><input name=username size="30" id="username" type="text"/></li>
      <li>Contrase&ntilde;a:<br /><input name=password size="30" id="password" type="password"/></li>
      <li><input type="submit" value="Enviar"></li>
      <li><input type="button" name="boton1" value="Registrarse" onclick="JavaScript:location.href='registro.html'"></li>
    </ul>
    </form>
    <%
    }
    else
    {
    %>
    <ul class="nav2">
      <li><a href="index.jsp">Buscar Libros <img src="lupa_b.png" width="20" height="20" style="margin-bottom:-5px"></a></li>
      <li><a href="ModificarDatos.jsp">Modificar mis datos <img src="lapiz.png" height="22" style="margin-bottom:-5px"></a></li>
      <li><a href="MisReservas.jsp">Mis Reservas <img src="libros.png" height="22" style="margin-bottom:-5px"></a></li>
      <li><a href="CierreSesion.jsp">Cerrar Sesi&oacute;n: <b><%=user.getUsername()%></b></a></li>
    </ul>
    <%
    }
    %>
  </div>
  <div class="content" align="center">
<%
       Conectar conn = new Conectar();
       String resp = conn.Conectar();
       
       if (resp.equals("OK"))
       {
           Statement consulta = conn.Consulta();
            
            String sql = "SELECT * FROM libros WHERE isbn='"+ libr +"' ";
            //out.println(sql);
            ResultSet rs=consulta.executeQuery(sql);
            
            if(!rs.isBeforeFirst())
            {
                %>
                No se encontraron resultados.
                <%
            }
            else
            {
                rs.next();
                %>
                <table width="95%" border="0" cellpadding="2">
                    <tr bgcolor="#FFCC99">
                        <td colspan="2"><span style="font-size: 30px; margin-left: 10px;"><b><%=rs.getString("titulo")%></b></span></td>
                    </tr>
                    <tr>
                      <td width="14%" align="right" bgcolor="#FFCC99"><strong>Autor</strong>:</td>
                      <td width="86%"><%=rs.getString("autor")%></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#FFCC99"><strong>Editorial</strong>:</td>
                      <td><%=rs.getString("editorial")%></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#FFCC99"><strong>G&eacute;nero</strong>:</td>
                      <td><%=rs.getString("genero")%></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#FFCC99"><strong>ISBN</strong>:</td>
                      <td><%=rs.getString("isbn")%></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#FFCC99"><strong>Sinopsis</strong>:</td>
                      <td><%=rs.getString("sinopsis")%></td>
                    </tr>
                    <tr bgcolor="#FFCC99">
                      <td align="center" colspan="2" height="30">
                          <%
                              Statement consulta2 = conn.Consulta();
                              String sql2 = "SELECT * FROM reservas WHERE isbn='" +libr+"' AND fecha_hasta>CURDATE()";
                              ResultSet rs2=consulta2.executeQuery(sql2);

                              if(!rs2.isBeforeFirst())
                              {   
                                  %>
                                  <input name="reservar" type="button" value="Reservar" style="cursor:pointer; width:100px" onclick="location = 'ReservarLibro.jsp?isbn=<%=rs.getString("isbn")%>'">&nbsp; 
                                  <%
                              }
                              else
                              {
                                %>
                                <span style="font-style:italic; font-size:12px">Lo sentimos pero el libro no est&aacute; disponible.</span><br>   
                                <%
                              }
                          %>
                        <input name="volver" type="button" value="Volver" style="cursor:pointer; width:100px" onClick="history.back();">
                      </td>
                    </tr>
               </table>
            <%
            }
       }
       else
       {
           %>
            <script>
               alert("Conexion fallida"); 
            </script>

            <% 
       }
       
       
    
%>
    
  </div>
  <div class="footer" align="center">
    <span style="font-size:10px"><b>Trabajo Final Java - UTN - FRRO</b><br />
    Alvarez, Federico - Muccini, Ver&oacute;nica</span>
  </div>
</div>
</body>
</html>
