<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Venta hecha</title>
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
			        <a class="nav-link" href="index.html">Inicio<span class="sr-only">(current)</span></a>
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
		Statement stmt_1;
		ResultSet rs;
		ResultSet rs_1;
		ResultSet rs_2;
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
		String bc="";
		String n_venta="";
		String id_cl="";
		Double imp_total=0.0;

	%>
	<% Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection(dburl,user,password);
		stmt = con.createStatement();
		String query ="";
		String query0 ="";
		String query1 ="";
		String query2 ="";
		String query3="";
		String query4="";
		String query5="";
		String query6="";
		String query7="";
		String query8="";
		String Rseleccion="";
		String Rcliente="";
		String Rid_tipo_prod="";
		String Rmarca="";
		String Uid="";
		String Rid_cliente="";
		
	%>
	<div class="container">
		<h2>Venta realizada con exito</h2>

	<%
		query = "select * from productos inner join ticket on productos.id_producto = ticket.id_producto where id_venta =(select max(id_venta)from ticket)";
		rs = stmt.executeQuery(query);
	%>

	<table id="gestion">
		<h2>Información recuperada </h2>
		<thead>
			<tr>
				<th> ID producto</th>
				<th> ID venta</th>
				<th> Sabor</th>
				<!--<th> Marca</th>-->
				<th> Tamaño</th>
				<th> Precio</th>
				<th> Cantidad<br>
				<th> Importe<br>
			</tr>
		</thead>
		<tbody>
			
		<%
			while (rs.next()) {
			String Rid_pd = rs.getString("id_producto");
			String Rid_vt = rs.getString("id_venta");
			String Rsab = rs.getString("sabor");
			//String Rmc = rs.getString("marca");
			String Rtam = rs.getString("tamanio");
			String Rprecio = rs.getString("precio_unitario");
			String Rpiezas = rs.getString("piezas");
			double db_precio = Double.parseDouble(Rprecio);
			double db_piezas = Double.parseDouble(Rpiezas);
			double db_importe = db_precio*db_piezas;
			imp_total = imp_total+db_importe;
			query0 = "select cantidad_ingresar from productos where id_producto = "+Rid_pd+" ";
			rs_1 = stmt.executeQuery(query0);
			while(rs_1.next()){

			String oldCatAlm = rs_1.getString("cantidad_ingresar");
			double i_oldCatAlm = Double.parseDouble(oldCatAlm);
			double newCatAlm = i_oldCatAlm - db_piezas;
			query1="update productos set cantidad_ingresar ="+newCatAlm+" where id_producto ="+Rid_pd+" ";
			stmt.executeUpdate(query1);
			//out.print("newc:"+query1);

			}
			//query1 = "select cantidad_ingresar from productos where id_producto = "+Rid_pd+" ";
		%>
			<tr>
				<td><%= Rid_pd %></td>
				<td><%= Rid_vt %></td>
				<td><%= Rsab %></td>
				<td><%= Rtam %></td>
				<td><%= Rprecio %></td>
				<td><%= Rpiezas %></td>
				<td><%= db_importe%></td>
			</tr>
		<%
			}
		%>
		<tbody>
		<!--consulta productos con id tipo pd e id marca seleccionada------------------------------------>
		
	</table>
		<div class="importeTotal">
			
		<button id="regresarVentas"><a href="selectClPurchase.jsp">Regresar a ventas</a></button>
		<span id="importeTotal">Importe Total: <%=imp_total%></span>
		<%
			imp_total=0.0;
		%>


		</div>	
	</div>
</body>
</html>