<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="es-MX" >
	<head>
		<title>Eliminar clientes</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
		<link rel="stylesheet" href="css/estilos.css">
	</head>
	<body>
		<header>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<div class="container">
						
				  <a class="navbar-brand" href="#">Surtibotana</a>
				  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"></span>
				  </button>

				  <div class="collapse navbar-collapse" id="navbarSupportedContent">
				    <ul class="navbar-nav ml-auto">
				      <li class="nav-item active">
				        <a class="nav-link" href="index.jsp">Inicio<span class="sr-only">(current)</span></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="menuProducts.html">Productos</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="menuClients.html">Clientes</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="menuCV.html">Compras</a>
				      </li>
				      
				    </ul>
				    
				  </div>
				</div>
			</nav>
		</header>
		<div class="container">
			
		<%! Connection con;
			Statement stmt;
			ResultSet rs;
			String dburl="jdbc:postgresql://localhost:5432/surtibotana";
			String user="rem_user";
			String password="wky402";
		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
			String query ="";
		%>
		<%
			query = "select * from clientes"; //comentario Java
			rs=stmt.executeQuery(query);
		%>
		<table>
			<h2>Elija un cliente a eliminar </h2>
			<thead>
				<tr>
					<th> Nombre</th>
					<th> Telefono </th>
					<th> Colonia </th>
					<th> Codigo Postal </th>
					<th> Responsable </th>
					<th> Tipo de producto </th>
				</tr>
			</thead>
			<tbody>
			<%
				while (rs.next()) {
				String Cnombre = rs.getString("nombre");
				String Ctelefono = rs.getString("telefono");
				String Ccolonia = rs.getString("colonia");
				String Ccpostal = rs.getString("c_postal");
				String Cresponsable = rs.getString("responsable");
				String Ctipoproducto = rs.getString("tipo_producto");
			%>
				<tr><td><%= Cnombre %></td>
					<td><%= Ctelefono %></td>
					<td><%= Ccolonia %></td>
					<td><%= Ccpostal %></td>
					<td><%= Cresponsable %></td>
					<td><%= Ctipoproducto %></td>
				</tr>
			<%
				}
			%>
			
			<tbody>
				<%
					query = "select * from clientes"; //comentario Java
					rs=stmt.executeQuery(query);
				%>
		</table>
		<form name="sd_elimina" action="backDeleteClient.jsp" onsubmit="return validar();">
			<select name="elimina_cliente">
				<%
					while (rs.next()) {
					String Rid = rs.getString("id_cliente");
					String Rcliente = rs.getString("nombre");
				%>
				<option id="nombreCliente" value="<%=Rcliente%>"><%=Rcliente%></option>
				<%
					}
				%>
			</select><br><br>
			<input type="submit" value="Eliminar Cliente">
		</form>
		</div>
		<script src="js/verificaDeleteClient.js" ></script>
	</body>
</html>