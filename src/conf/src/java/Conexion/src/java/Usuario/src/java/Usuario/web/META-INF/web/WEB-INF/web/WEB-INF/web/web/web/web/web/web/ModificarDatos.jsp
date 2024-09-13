<jsp:useBean id="user" class="Usuario.Data" scope="session"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>

<script>

</script>
<link href="estilo.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div class="container" align="center">
  <div class="header" align="center">
        <h1 style="padding-top:10px; margin-bottom:-5px">Biblioteca Virtual</h1>
        Sistema Online de Reserva de Libros
  </div>
  <div class="contentFull" align="center">
    <form action="Registrar.jsp" method="post">
    <table width="100%" border="0" cellpadding="0">
      <tr>
      <td colspan="2" align="center" bgcolor="#FFCC99" style="padding-top: 20px;"><h3>Datos de <%=user.getUsername()%></h3></td>
      </tr>
      <tr>
        <td width="50%" align="right">Nombre:</td>
        <td width="50%"><input name="nombre" size="30" type="text" value="<%= user.getNombre() %>"/></td>
      </tr>
      <tr>
        <td width="50%" align="right">Apellido:</td>
        <td><input name="apellido" size="30" type="text" value="<%=user.getApellido()%>"/></td>
      </tr>
      <tr>
        <td width="50%" align="right">DNI:</td>
        <td><input name="dni" type="text" size="10" maxlength="9" value="<%= user.getDni() %>" readonly=""/></td>
      </tr>
      <tr>
        <td width="50%" align="right">Tel&eacute;fono:</td>
        <td><input name="telefono"  value="<%= user.getTel() %>" type="text" size="10" maxlength="20" /></td>
      </tr>
      <tr>
          <td colspan="2" align="center"> <a href="FormPass.html" style="font-size: 11px" >Cambiar contrase&ntilde;a</a></td>
      </tr>
      <tr>
      <td height="10" colspan="2"></td>
      </tr>
      <tr bgcolor="#FFCC99">
        <td colspan="2" align="center"><input type="submit" value="Enviar" style="width:100px; cursor:pointer">&nbsp;&nbsp;<input type="button" onclick="location='index.jsp'" value="Cancelar" style="width:100px; cursor:pointer"></td>
        </tr>
    </table>
      <input type="hidden" name="Mod" value="si"/>
    </form>
<br />
</div>
<div class="footer" align="center">
  <span style="font-size:10px"><b>Trabajo Final Java - UTN - FRRO</b><br />
  Alvarez, Federico - Muccini, Ver&oacute;nica</span>
</div>
</div>

</body>
</html>
