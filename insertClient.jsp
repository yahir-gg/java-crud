<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="es-MX" >
	<head>
		<title>Añadir nuevo cliente</title>
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
			
		<%! Connection con;
			Statement stmt;
			ResultSet rs;
			String dburl="jdbc:postgresql://localhost:5432/surtibotana";
			String user="append_user";
			String password="hfe372";
		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
			String query ="";
		%>
		<%
			query = "select * from tipo_productos"; //comentario Java
			rs=stmt.executeQuery(query);
		%>
		<div class="container">
			<h2>Añadir nuevo cliente</h2>
			<form id = "gestion" action="backInsertClient.jsp" method="get" onsubmit="return validar();">
				
				<input type="text" id="nombreCliente" name="nombreCliente" value="" placeholder="Nombre del negocio"autofocus>
				<br><br>
				<input type="text" id="coloniaCliente" name="coloniaCliente" value="" placeholder="Colonia">
				<br><br>
				<input type="text" id="cpCliente" name="cpCliente" value="" placeholder="Código Postal">
				<br><br>
				<input type="text" id="telefonoCliente" name="telefonoCliente" placeholder="Número telefonico">
				<br><br>
				<input type="text" id="responsableCliente" name="responsableCliente" placeholder="Responsable del negocio">
				<br><br>
				<label>Selecciona el tipo de producto que se surtira al cliente</label><br>
				<select id="tipoProducto" name="tipoProducto">
					<%
						while (rs.next()) {
						String Rid = rs.getString("id_tipo_prod");
						String Rtipo = rs.getString("tipo");
					%>
					<option value="<%= Rtipo %>"> <%= Rtipo %> </option>
					<%
						}
					%>
				</select><br><br>
				<input type="submit" value="Agregar cliente">
			</form>
		</div>
		<script src="js/validarInsertClient.js"></script>
	</body>
</html>