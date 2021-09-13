<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="es-MX" >
	<head>
		<title>Mostrar clientes</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="css/estilos.css">
	</head>
	<body>
		<header>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<div class="container">
						
				  <a class="navbar-brand" href="#">Surtinbotana</a>
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
			String user="read_user";
			String password="psi852";
			String Rseleccion="";
			String id_search="";
		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
			String query ="";
			String query1 ="";
			String query2 ="";
			String query3 ="";
			String query_id="";
			int intSeleccion;
			int int_id_search;
		%>
		<%
			query = "select * from clientes"; //comentario Java
			query1 = "select * from clientes order by id_cliente"; //comentario Java
			query2 = "select * from clientes order by nombre"; //comentario Java
			query3 = "select * from clientes order by tipo_producto"; //comentario Java
			//rs=stmt.executeQuery(query);
			
		%>
		<div class="container">

			<table id="gestion">
				<h2>Clientes</h2>
				<div class="container tools">
					<div class="cajahelp">
					<form class="orden_idsearch" action="showClients.jsp">
						<label for="id_search">Introduce el ID del producto a buscar</label><br>
						<input class="box_searchid" name="id_search" type="text" placeholder="Ingrese el ID a buscar"><br>
						<div class="botonorden">
							
						<input class="btn_searchid" type="submit" value="Buscar">
						</div>
					</form>
						
					</div>
					<div class="cajahelp">
						
					<form class="orden_idsearch" action="showClients.jsp">
							<label for="">Selecciona tu opción y da clic en ordenar</label><br>
						<select name="opcion" id="">
							<option value="1">ID</option>
							<option value="2">Nombre</option>
							<option value="3">Tipo de producto</option>
						</select><br>
						<div class="botonorden">
							<input class="btn_orden" type="submit" value="Ordenar">
						</div>
					</form>	
					</div>
				</div>
				

				<%
					request.setCharacterEncoding("UTF-8");
					Rseleccion = request.getParameter("opcion");
					id_search = request.getParameter("id_search");
					query_id = "select * from clientes where id_cliente = '"+id_search+"'";
					try {
					  //  Block of code to try
					  intSeleccion = Integer.parseInt(Rseleccion);
					}
					catch(Exception e) {
					  //  Block of code to handle errors
					  intSeleccion = 1;
					}
					

				%>
				<%
				
					if (id_search != null) {
						rs=stmt.executeQuery(query_id);	
					}else if (intSeleccion==1) {
						rs=stmt.executeQuery(query1);
					}else if(intSeleccion==2){
						rs=stmt.executeQuery(query2);
					}else if(intSeleccion==3){
						rs=stmt.executeQuery(query3);
					}else{
						intSeleccion = 1;
						rs=stmt.executeQuery(query1);
					}
				%>

				<thead>
					<tr>
						<th> ID</th>
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
					String Cid= rs.getString("id_cliente");
					String Cnombre = rs.getString("nombre");
					String Ctelefono = rs.getString("telefono");
					String Ccolonia = rs.getString("colonia");
					String Ccpostal = rs.getString("c_postal");
					String Cresponsable = rs.getString("responsable");
					String Ctipoproducto = rs.getString("tipo_producto");
				%>
					<tr class="tr">
						<td><%= Cid %></td>
						<td><%= Cnombre %></td>
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
			</table>
		</div>
	</body>
</html>