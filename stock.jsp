<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="es-MX" >
	<head>
		<title>Consultar inventario</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/estilos.css">
	</head>
	<body>
		<nav>
			<div class="brand_image">
				<img src="" alt="">
			</div>
			<div class="nav_options">
				<ul>
					<li><a href="index.html">Inicio</a></li>
					<li><a href="">Opcion2</a></li>
				</ul>
			</div>
		</nav>
		<div class="main_section">
			
		<%! Connection con;
			Statement stmt;
			ResultSet rs;
			String dburl="jdbc:postgresql://localhost:5432/surtibotana";
			String user="postgres";
			String password=" ";
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
			query = "select * from tipo_productos";
			rs=stmt.executeQuery(query);
		%>
		<h2>Consultando inventario</h2>

		<!--Despliegue tipos de productos--------------------------------------------------------->

		<form id="form_show_tp" action="stock.jsp" method="get">
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
			<input type="submit" value="consultar">
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
				query3 = "select * from marcas where id_tipo_prod= "+casti+" "; //comentario Java
				rs=stmt.executeQuery(query3);
			%>
			<!--Despliegue de esas de marcas----------------------------------------------------------------------->		
			<form id="form_show_mc" action="stock.jsp" method="get">
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
				<input type="submit" value="seleccionar marca">
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
						<th> Cantidad<br> en Almacen</th>
					</tr>
				</thead>
				<tbody>
				<%
					while (rs.next()) {
					String Rid_pd = rs.getString("id_producto");
					String Rsab = rs.getString("sabor");
					String Rtam = rs.getString("tamanio");
					String Rc_alm = rs.getString("cantidad_ingresar");
				%>
					<tr><td><%= Rid_pd %></td>
						<td><%= Rsab %></td>
						<td><%= Rtam %></td>
						<td><%= Rc_alm %></td>
					</tr>
				<%
					}
				%>
				<tbody>
				<!--consulta productos con id tipo pd e id marca seleccionada------------------------------------>
				
			</table>
			<!--Despliegue de id para actualizar------------------------------------------------------>
			
		<%
			}
		%>
		
		
		<!--Consulta de productos con id seleccionado-------------------------------------------------->
		
		<!--Despliegue de datos del productos con is seleccioando---------------------------------------->
				
		
	
		
		</div>
	</body>
</html>