<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="es-MX" >
	<head>
		<title>Ingresar productp</title>
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
		<div class="container">
			
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
			String Rid_cliente="";			 
			int id_cl=0;			 
		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
			String query0 ="";
			String queryCl ="";
			String query2 ="";
			String query3="";
			String query4="";
			String query5="";
			String Rseleccion="";
			String Rid_tipo_prod="";
			
		%>
		<%
			queryCl = "select * from clientes"; //comentario Java
			rs=stmt.executeQuery(queryCl);
		%>
		
		
		<!--<span><%=Rcliente%></span>-->
			
		<h2>Actualizar datos de cliente</h2>
		<form id="gestion" action="selectClPurchase.jsp" method="get">
			<label>Selecciona el cliente a actualizar</label><br>
			<select name="seleccion_cl">
				<%
					while (rs.next()) {
					Rcliente = rs.getString("nombre");
					Rid_cliente = rs.getString("id_cliente");
					//id_cl = Integer.parseInt(Rid_cliente);
				%>
				<option value="<%= Rid_cliente %>"> <%= Rcliente %> </option>
				<%
					}
				%>
			</select><br><br>
			<input type="submit" value="consultar" >
			<%
				request.setCharacterEncoding("UTF-8");
				Rseleccion = request.getParameter("seleccion_cl");
			%>
			<%
			if(Rseleccion!=null){
			try {
				//out.print("TRYYYYYYY");
			 	query0 = "insert into ventas (fecha,id_cliente) values((select current_date),"+Rseleccion+")";
			 	stmt.executeUpdate(query0);
			 	response.sendRedirect("http://localhost:8080/surtibotana/selectPdPurchase.jsp");
			
			} catch(NumberFormatException nfe) {
			//out.print("CATCHHHHHH");
				query0 = "insert into ventas (fecha,id_cliente) values((select current_date),"+Rcliente+")";
				stmt.executeUpdate(query0);
				
			}
			}else{
				//out.print("ELSEEEE");
				}
				
			%>
		</form>
		</div>
		
		
	</body>
</html>