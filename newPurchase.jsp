<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="es-MX" >
	<head>
		<title>Ingresar productp</title>
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
			String Rmarca="";
			String Rcliente="";			 
		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
			String query ="";
			String queryCl ="";
			String query2 ="";
			String query3="";
			String query4="";
			String query5="";
			String Rseleccion="";
			String Rid_tipo_prod="";
			
		%>
		
		
		
		
		<!--Seleccion del tipo de producto--------------------------------------------------------->
		<h2>Añadiendo nuevo producto</h2>
		<%
			query = "select * from tipo_productos";
			rs=stmt.executeQuery(query);
		%>

		<form id="form_show_tp" action="newPurchase.jsp" method="get">
			<label>Selecciona el ctipo de producto</label><br>
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
			<input type="submit" value="consultar" onclick="hide()">
		</form>
		<%
				request.setCharacterEncoding("UTF-8");
			Rseleccion = request.getParameter("seleccion_tp");
		%>
		<!--consulta ID del tipo de producto----------------------------------------------------------->
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
		
		<!--Marcas que pertenecen al tipo de productp-------------------------------------------------->	
		<%
			query3 = "select * from marcas where id_tipo_prod= "+casti+" "; //comentario Java
			rs=stmt.executeQuery(query3);
		%>
		<!--Seleccion de marcas----------------------------------------------------------------------->		
		<form id="form_show_mc" action="newPurchase.jsp" method="get">
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
			<input type="submit" value="consultar marca" onclick="hide()">
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
		<h3>Rellene todos los campos para añadir <br>un producto nuevo a la base de datos</h3>						
		<form action="newPurchase.jsp">
			<label>Cantidad a ingresar</label>
			<input type="number" name="pd_cant" placeholder="Ejemplo: 50" value="" ><br><br>
			<input type="submit" name="" value="Agregar al carrito">
		</form>
		<%
			}
		%>
		<button><a href="http://localhost:8080/surtibotana/newPurchase.jsp">Más productos</a></button>
		</div>
		<script type="text/javascript" src="showandhide.js"></script>
	</body>
</html>