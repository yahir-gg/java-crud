<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.Matcher"%>
<%@ page import="java.util.regex.Pattern"%>
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
			String user="rem_user";
			String password="wky402";
			String ID_a_eliminar="";
			String Nombre_a_eliminar="";
			String query="";
			int id_pd;
			boolean campoValido = false;
		%>
		<%
			Pattern pattern = Pattern.compile("^[0-9]+$");
		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
		%>
		<%
			request.setCharacterEncoding("UTF-8");
			ID_a_eliminar = request.getParameter("seleccion_id_delete");
			    Matcher mather = pattern.matcher(ID_a_eliminar);
			    if (mather.find() == true) {      
				    campoValido = true;      
			    }else{
			    String mensaje="<script type= 'text/javascript'>var1 = confirm('Error al eliminar producto'); if(var1==true){location.href='http://localhost:8080/surtibotana/deleteClient.jsp';}else{location.href='http://localhost:8080/surtibotana/deleteClient.jsp';};</script>";
			    //out.print(campoValido);
			    out.print(mensaje);
			          //out.print("El email ingresado es inválido.");
			           
			      }
		%>

		
		<%
		
			
		%>
		<!--Consulta de productos con id seleccionado-------------------------------------------------->
		<%
			if (campoValido==true) {
			request.setCharacterEncoding("UTF-8");
			try {
			  id_pd = Integer.parseInt(request.getParameter("seleccion_id_delete"));
			
			} catch(NumberFormatException nfe) {
				
			}
			query = "delete from productos where id_producto = ?"; //comentario Java
			PreparedStatement sentencia = con.prepareStatement(query);
					sentencia.setInt(1,id_pd);
					sentencia.executeUpdate();
					sentencia.close();
			response.sendRedirect("http://localhost:8080/surtibotana/success.html");
			}else{
				response.sendRedirect("http://localhost:8080/surtibotana/failed.html");
			}
			con.close();
		%>
		
		</div>
	</body>
</html>