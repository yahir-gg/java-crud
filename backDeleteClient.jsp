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
			boolean campoValido=false;
		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
		%>
		<%
			Pattern pattern = Pattern.compile("^[A-Za-z. ]+$");
		%>
		<%
			request.setCharacterEncoding("UTF-8");
			Nombre_a_eliminar = request.getParameter("elimina_cliente");
			    Matcher mather = pattern.matcher(Nombre_a_eliminar);
			    if (mather.find() == true) {      
				    campoValido = true;      
			    }else{
			    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo NOMBRE invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/deleteClient.jsp';}else{location.href='http://localhost:8080/surtibotana/deleteClient.jsp';};</script>";
			    //out.print(campoValido);
			    out.print(mensaje);
			          //out.print("El email ingresado es inválido.");
			           
			      }
		%>

		
		<%	
			if (campoValido == true) {
				
			query = "delete from clientes where nombre =?";
			PreparedStatement sentencia = con.prepareStatement(query);
					sentencia.setString(1,Nombre_a_eliminar);
					sentencia.executeUpdate();
					sentencia.close();
			con.close(); //Cerrando conexión con el servidor de Base de Datos
			}else{
			    String mensaje="<script type= 'text/javascript'>var1 = confirm('Error al intentar eliminar cliente'); if(var1==true){location.href='http://localhost:8080/surtibotana/deleteClient.jsp';}else{location.href='http://localhost:8080/surtibotana/deleteClient.jsp';};</script>";
			    //out.print(campoValido);
			    out.print(mensaje);
			          //out.print("El email ingresado es inválido.");
			           
			      }
		%>
		
		</div>
	</body>
</html>