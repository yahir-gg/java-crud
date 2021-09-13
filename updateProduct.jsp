<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="es-MX" >
	<head>
		<title>Modificar productos</title>
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
			        <a class="nav-link" href="menuProducts.jsp">Productos</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="menuClients.jsp">Clientes</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="menuCV.jsp">Compras</a>
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
			int casti;
			int id_m;
			Integer id_pd=0;
			String Rpd="";
			String Rpd_tam="";
			String Rpd_t_id="";
			String Rpd_t_pr="";
			String Rpd_t_tipo_pd="";
			String Rpd_t_id_mc="";
			String Rpd_t_al="";

		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
			String query ="";
			String query2 ="";
			String query3="";
			String query4="";
			String query5="";
			String query6="";
			String query7="";
			String Rseleccion="";
			String Rid_tipo_prod="";
			String Rmarca="";
			String Uid="";
			
		%>

		<!--Cosulta tipos de productos--------------------------------------------------------->
		<%
			query = "select * from tipo_productos order by tipo";
			rs=stmt.executeQuery(query);
		%>
		<h2>Modificando producto</h2>

		<!--Despliegue tipos de productos--------------------------------------------------------->

		<form id="form_show_tp" action="updateProduct.jsp" method="get">
			<label>Selecciona el tipo de producto</label><br>
			<select name="seleccion_tp">
				<%
					while (rs.next()) {
					Rseleccion = rs.getString("tipo");
				%>
				<option value="<%= Rseleccion %>"> <%= Rseleccion %> </option>
				<%
					}
				%>
			</select><br><br>
			<input type="submit" value="Consultar" class="contop">
		</form>
		<%
			request.setCharacterEncoding("UTF-8");
			Rseleccion = request.getParameter("seleccion_tp");
		%>
		<!--consulta ID del tipo de producto del tipo seleccionado---------------------------------------->
		<%
			query2 = "select id_tipo_prod from tipo_productos where tipo = '"+Rseleccion+"' ";
			rs=stmt.executeQuery(query2);
		%>
		<!--ID del tipo de producto---------------------------------------------------------------------->
		<%
			while (rs.next()) {
			Rid_tipo_prod = rs.getString("id_tipo_prod");
			casti=Integer.parseInt(Rid_tipo_prod);
		%>
		
			<!--Consulta Marcas que pertenecen al tipo de productp-------------------------------------------------->	
			<%
				query3 = "select * from marcas where id_tipo_prod= "+casti+" order by marca"; //comentario Java
				rs=stmt.executeQuery(query3);
			%>
			<!--Despliegue de esas de marcas----------------------------------------------------------------------->		
			<form id="form_show_mc" action="updateProduct.jsp" method="get">
				<label>Selecciona la marca</label><br>
				<select name="seleccion_mc">
				<%
					while (rs.next()) {
					Rmarca = rs.getString("marca");
				%>
				<option value="<%= Rmarca %>"> <%= Rmarca%> </option>
				<%
					}
				%>
				</select><br><br>
				<input type="submit" value="seleccionar marca" class="contop">
			</form>
		<%
			}
		%>	
		<%
			request.setCharacterEncoding("UTF-8");
			Rmarca = request.getParameter("seleccion_mc");
		%>
		<!--consulta ID de la marca---------------------------------------------------------------------->
		<%
			query4 = "select id_marca from marcas where marca = '"+Rmarca+"' "; //comentario Java
			rs=stmt.executeQuery(query4);
		%>
		<!--ID del tipo de la marca-->			   				
		<%
			while (rs.next()) {
			String Get_id_marca = rs.getString("id_marca");
			id_m = Integer.parseInt(Get_id_marca);
		%>
			<!--Consulta de productos con id tipo pd y con id marca seleccionada------------------------------------->
			<%
				query5 = "select * from productos where id_tipo_prod = "+casti+" and id_marca = "+id_m+" "; //comentario Java
				rs=stmt.executeQuery(query5);
			%>
			<!--Despliegue tabla con productos--------------------------------------------------------->
			<table id="gestion">
				<h2>Información recuperada </h2>
				<thead>
					<tr>
						<th> ID producto</th>
						<th> Sabor</th>
						<th> Tamaño</th>
						<th> Precio</th>
						<th> Almacen</th>
					</tr>
				</thead>
				<tbody>
				<%
					while (rs.next()) {
					String Rid_pd = rs.getString("id_producto");
					String Rsab = rs.getString("sabor");
					String Rtam = rs.getString("tamanio");
					String Rprecio = rs.getString("precio_unitario");
					String Ralm = rs.getString("id_almacen");
				%>
					<tr><td><%= Rid_pd %></td>
						<td><%= Rsab %></td>
						<td><%= Rtam %></td>
						<td><%= Rprecio %></td>
						<td><%= Ralm %></td>
					</tr>
				<%
					}
				%>
				<tbody>
				<!--consulta productos con id tipo pd e id marca seleccionada------------------------------------>
				<%
					query6 = "select * from productos where id_tipo_prod = "+casti+" and id_marca = "+id_m+" "; //comentario Java
					rs=stmt.executeQuery(query6);
				%>
			</table>
			<!--Despliegue de id para actualizar------------------------------------------------------>
			<form id="" action="updateProduct.jsp" method="get">
				<label>Selecciona el id del producto a actualizar</label><br>
				<select name="seleccion_idupdate">
				<%
					while (rs.next()) {
					Uid = rs.getString("id_producto");
					
				%>
				<option value="<%= Uid %>"> <%= Uid%> </option>
				<%
					}
				%>
				</select><br><br>
				<input type="submit" value="seleccionar id">
			</form>
		<%
			}
		%>
		
		<%
		request.setCharacterEncoding("UTF-8");
		try {
		  id_pd = Integer.parseInt(request.getParameter("seleccion_idupdate"));
		
		} catch(NumberFormatException nfe) {
			
		}
			
		%>
		<!--Consulta de productos con id seleccionado-------------------------------------------------->
		<%
			query7 = "select * from productos where id_producto = "+id_pd+""; //comentario Java
			rs=stmt.executeQuery(query7);
		%>
		<!--Despliegue de datos del productos con is seleccioando---------------------------------------->
				<%
					while (rs.next()) {
					String Pd_id = rs.getString("id_producto");
					String Pd_sabor = rs.getString("sabor");
					String Pd_tam = rs.getString("tamanio");
					String Pd_precio = rs.getString("precio_unitario");
					String Pd_id_al = rs.getString("id_almacen");
				%>
		
			<form id="form_show_data_pd" action="backUpdateProduct.jsp" method="get" onsubmit="return validar();">
				<label>ID Producto</label>
				<input type="text" id="pd_id" name="pd_id" value="<%=Pd_id%>" readonly="readonly"><br>
				<label>Sabor</label>
				<input type="text" id="pd_sabor" name="pd_sabor" placeholder="Ejemplo: uva" value="<%=Pd_sabor%>"><br>
				<label>Tamaño</label>
				<input type="text" id="pd_tamanio" name="pd_tamanio" placeholder="Ejemplo: 120 ml" value="<%=Pd_tam%>"><br>
				<label>Precio</label>
				<input type="text" id="pd_precio" name="pd_precio" placeholder="Ejempo: 10.50" value="<%=Pd_precio%>"><br>
				<label>Almacen</label>
				<input type="text" id="pd_almacen" name="pd_almacen" placeholder="Ejemplo: 1" value="<%=Pd_id_al%>"><br><br>
				
				<input type="submit" name="" value="Actualizar producto">
				
				
			</form>
		
				<%
					id_pd = 0;
				%>
				<%
					}
				%>
		
	
		
		</div>
		<script src="js/validarUpdateProduct.js"></script>
	</body>
</html>