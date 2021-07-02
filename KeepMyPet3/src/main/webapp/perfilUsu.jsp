<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%= page import="com.eoi.servicios.conexion" %>
<% import java.com.eoi.modelo.CuentaDao; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Perfil del usuario</title>
</head>
<body>
<%

	Connection con = conexion.getInstance().getConnection();
	String sql="SELECT * FROM usuario Where UsuNombre=?";
	con= conexion.getInstance().getConnection();
	pst=con.prepareStatement(sql);
	session.setString(1,u.getUsuId());
%>
<TABLE BORDER>
	<TR>
		<TH>nombre</TH> <TH>contraseña</TH> 
	</TR>
	<TR>
		<TD><% session.getUsuNombre %></TD> <TD><% session.getUsuPass %></TD> 
	</TR>
	<TR>
		<TD>D</TD> <TD>E</TD> 
	</TR>
</TABLE>
<div id="adoptar">
<input type="button" name="adoptar">
</div>
<div id="adoptar">
<input type="button" name="dar en adopcion">
</div>
</body>
</html>