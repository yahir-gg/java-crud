<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" session = "true" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1); //prevents caching at the proxy server  
%>
<!DOCTYPE html>
<html lang="es-MX" >
	<head>
		<title>Mostrar productos</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
		<link rel="stylesheet" href="css/estilos.css">
		
	</head>
	<body>
		<%
			HttpSession sesion = request.getSession();
			String usuario;
			String nombre="";
			String apellido="";
			String priv;
			// si la sesion es existe entonces paso los atributos de la sesion a variables
			if (sesion.getAttribute("misesion")!=null){
				
				usuario = sesion.getAttribute("misesion").toString();
				nombre 	= sesion.getAttribute("n_user").toString();
				apellido = sesion.getAttribute("a_user").toString();
				priv 	= sesion.getAttribute("priv_user").toString();
				
			}else{

				//out.print("si es nula");
				out.print("<script>location.replace('login.jsp');</script>");
			}
		%>
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
			String user="read_user";
			String password="psi852";
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
		<h2>Mostrando productos</h2>

		<!--Despliegue tipos de productos--------------------------------------------------------->
		<div>
		<form id="form_show_tp" action="showProducts.jsp" method="get">
			<div class="container tools">
				<div>
					<form class="orden_idsearch" action="showClients.jsp">
						<label for="id_search">Ingresa el ID de un producto para buscarlo</label><br>
						<input class="box_searchid" name="id_search" type="text" placeholder="Buscar por ID">
						<input class="btn_searchid" type="submit" value="Buscar">
					</form>
				</div>
				<div>
						<label>Paso 1 de 2. Selecciona el tipo de producto <br>y da clic en continuar</label><br>
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
						<input class="contop" type="submit" value="Continuar">
					</form>
				</div>
			
			
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
			<form id="form_show_mc" action="showProductsOnTable.jsp" method="get">
				<label> Paso 2 de 2. Selecciona la marca <br>y selecciona ver producto</label><br>
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
				<input type="submit" value="Ver producto" class="contop">
			</form>
			</div>
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
			<!--Consulta de productos con id tipo pd y con id marca seleccionada------------------------------------->
			<%
				query5 = "select * from productos where id_tipo_prod = "+casti+" and id_marca = "+id_m+" "; //comentario Java
				rs=stmt.executeQuery(query5);
			%>
			<!--Despliegue tabla con productos--------------------------------------------------------->
			<table id="gestion">
				<h2>Informaci??n recuperada </h2>
				<thead>
					<tr>
						<th> ID producto</th>
						<th> Sabor</th>
						<th> Tama??o</th>
						<th> Precio</th>
						<th> Almacen</th>
						<th> Cantidad</th>
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
					String Rcan = rs.getString("cantidad_ingresar");
				%>
					<tr class="tr">
						<td><%= Rid_pd %></td>
						<td><%= Rsab %></td>
						<td><%= Rtam %></td>
						<td><%= Rprecio %></td>
						<td><%= Ralm %></td>
						<td><%= Rcan %></td>
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