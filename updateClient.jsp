<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="es-MX" >
	<head>
		<title>Actualizar cliente</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
		<link rel="stylesheet" href="css/estilos.css">
	</head>
	<body>
		<header>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<div class="container">
						
				  <a class="navbar-brand" href="#">Navbar</a>
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
			String user="write_user";
			String password="mfs293";
		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
			String query ="";
			String query2 ="";
			String query3="";
			String Rcliente="";
			String selector="";
		%>

		<%
			query = "select * from clientes"; //comentario Java
			rs=stmt.executeQuery(query);
		%>
		
		<h2>Actualizar datos de cliente</h2>
		<form id="gestion" action="updateClient.jsp" method="get">
			<label>Selecciona el cliente a actualizar</label><br>
			<select name="clienteParaActualizar">
				<%
					while (rs.next()) {
					Rcliente = rs.getString("nombre");
				%>
				<option value="<%= Rcliente %>"> <%= Rcliente %> </option>
				<%
					}
				%>
			</select><br><br>
			<input type="submit" value="Continuar" class="contop">
		</form>
		<%
			request.setCharacterEncoding("UTF-8");
			Rcliente = request.getParameter("clienteParaActualizar");
		%>
		<%
			query2 = "select * from clientes where nombre ='"+Rcliente+"'";
			rs=stmt.executeQuery(query2);
		%>
		
			<table id="tabla2">
				<form id="gestion" action="backUpdateClient.jsp" method="get" onsubmit="return validar();">
					<%
						while (rs.next()) {
						String Rid_cliente = rs.getString("id_cliente");
						String Rnombre = rs.getString("nombre");
						String Rtelefono = rs.getString("telefono");
						String Rcolonia = rs.getString("colonia");
						String Rcpostal = rs.getString("c_postal");
						String Rresponsable = rs.getString("responsable");
						String Rtipoproducto = rs.getString("tipo_producto");
					%>
					<input class="inputs" type="hidden" name="formUno_nombreEmpresa" value="hhh" placeholder=""><br>
					<label>ID del cliente </label><br>
					<input class="inputs" type="text" id="sd_id" name="sd_id" value="<%=Rid_cliente%>" readonly="readonly"><br>
					<label>Nombre</label><br>
					<input class="inputs" type="text" id="sd_nombre" name="sd_nombre" value="<%= Rnombre %>"><br>
					<label>Telefono</label><br>
					<input class="inputs" ype="text" id="sd_telefono" name="sd_telefono" value="<%= Rtelefono %>"><br>
					<label>Colonia</label><br>
					<input class="inputs" type="text" id="sd_colonia" name="sd_colonia" value="<%= Rcolonia %>"><br>
					<label>Codigo Postal</label><br>
					<input class="inputs" type="text" id="sd_cpostal" name="sd_cpostal" value="<%= Rcpostal %>"><br>
					<label>Responsable</label><br>
					<input class="inputs" type="text" id="sd_responsable" name="sd_responsable" value="<%= Rresponsable %>"><br>
					<label>Tipo de producto: </label><br>
					<input class="inputs" type="text" id="sd_tipo_producto" name="sd_tipo_producto" value="<%= Rtipoproducto %>"><br><br>
					
					
					<input class="contop" type="submit" value="Actualizar cliente">
					
					<%
						}
					%>
				</form>
			</table>
		
		</div>
		<script src="js/validarUpdateClient.js"></script>
	</body>
</html>