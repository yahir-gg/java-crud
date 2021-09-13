<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="es-MX" >
	<head>
		<title>Ingresar producto</title>
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
			String user="append_user";
			String password="hfe372";
			int casti;
			int id_m;
			String Rmarca="";
		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
			String query ="";
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
			query = "select * from tipo_productos order by tipo";
			rs=stmt.executeQuery(query);
		%>
		<div class="container tools2">
			
		
		<form id="form_show_tp" action="insertProduct.jsp" method="get">
			<label>Paso 1 de 3. Selecciona el tipo de producto <br> y clic en continuar</label><br>
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
			<input type="submit" value="Continuar" class="contop">
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
			query3 = "select * from marcas where id_tipo_prod= "+casti+" order by marca"; //comentario Java
			rs=stmt.executeQuery(query3);
		%>
		<!--Seleccion de marcas----------------------------------------------------------------------->		
		<form id="form_show_mc" action="insertProduct.jsp" method="get">
			<label>Paso 2 de 3. Selecciona la marca</label><br>
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
			<input type="submit" value="consultar marca" class="contop">
		</form>
		</div>
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
		</div>
		<br>
		<div class="steptres">
		<h3>Paso 3 de 3. Rellene todos los campos para añadir <br>un producto nuevo a la base de datos</h3>						
		<form action="backInsertProduct.jsp" method="get" onsubmit="return validar();">
			<label>Marca</label>
			<input class="inputs" type="text" id="pd_marca" name="pd_marca" value="<%=Rmarca%>" readonly="readonly"><br>
			<label>ID Marca</label>
			<input class="inputs" type="text" id="pd_id_marca" name="pd_id_marca" value="<%=id_m%>" readonly="readonly"><br>
			<label>Tipo de producto</label>
			<input class="inputs" type="text" id="pd_tipo_p" name="pd_tipo_p" value="<%=casti%>" readonly="readonly"><br>
			<label>Sabor</label>
			<input class="inputs" type="text" id="pd_sabor" name="pd_sabor" placeholder="Ejemplo: uva" value=""><br>
			<label>Tamaño</label>
			<input class="inputs" type="text" id="pd_tamanio" name="pd_tamanio" placeholder="Ejemplo: 120 ml" value=""><br>
			<label>Precio</label>
			<input class="inputs" type="text" id="pd_precio" name="pd_precio" placeholder="Ejempo: 10.50" value=""><br>
			<label>Almacen</label>
			<input class="inputs" type="text" id="pd_almacen" name="pd_almacen" placeholder="Ejemplo: 1" value=""><br><br>
			<input class="btn" type="submit" name="" value="Añadir producto">
		</form>
		</div>
		<%
			}
		%>
		<script src="js/validarInsertProduct.js"></script>
	</body>
</jsp>