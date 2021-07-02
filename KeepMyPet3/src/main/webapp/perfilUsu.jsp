<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.eoi.servicios.conexion" %>
<%@ page import=" java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Perfil del usuario</title>
</head>
<body>
<%

	Connection con = conexion.getInstance().getConnection();
	String sql= "SELECT * FROM usuarios";
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(sql);
	//session.setString(1,u.getUsuId());
%>

<h2>Bienvenido <%=session.getAttribute("UsuNombre") %> - <%=session.getAttribute("rol")%></h2>

<nav>
		<ul>
			<%
			if (session.getAttribute("UsuRol").equals("admin")) {
			%>

			<li><a href="#"> Home</a></li>
			<%
			}
			%>
			<li><a href="altaUsuario.jsp"> Nuevo Usuario </a></li>
			<li><a href="Logout"> Logout</a></li>

		</ul>
	</nav>

	<table>
		<caption>
			<b>Lista de usuarios</b>
		</caption>
	<table>
	<tr>
		<th>UsuId</th>
		<th>UsuNombre</th>
		<th>UsuCiudad</th>
		<th>UsuTelf</th>
		<th>UsuDNI</th>
		<th>UsuMail</th>
		<% if(session.getAttribute("UsuRol").equals("admin")) { %>
			
			<th> Acciones </th>
			<% } %>
			</tr>
			
		<% while(rs.next()){ %>
        <tr>
            <td><%= rs.getString("UsuId") %></td>
            <td><%= rs.getString("UsuNombre") %></td>
            <td><%= rs.getString("UsuCiudad") %></td>
            <td><%= rs.getString("UsuTelf") %></td>
            <td><%= rs.getString("UsuMail") %></td>
            <% if(session.getAttribute("rol").equals("admin")) { %>
            <td><a href="Controlador?opcion=e&UsuId=<%=rs.getString("UsuId") %>"><i class="fa fa-edit" aria-hidden="true"></i></a>  <a href="Controlador?opcion=b&UsuId=<%=rs.getString("UsuId") %>"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
       	<% } %>
        </tr>
        <%} %>
        
        </table>
        
        <%
        rs.close();
        st.close();
        con.close();
        %>


</body>
</html>