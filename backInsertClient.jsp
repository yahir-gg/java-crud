<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.Matcher"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="es-MX" >
	<head>
	<title>Nuevo cliente</title>
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
			String user="append_user";
			String password="hfe372";
		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
			String NombreCliente ="";
			String ColoniaCliente ="";
			String CPCliente="";
			String TelefonoCliente="";
			String ResponsableCliente="";
			String TipoProducto="";
			String InsertarNewClient = "";
		%>
		<br> <br> <br>
		<%
			Pattern pattern = Pattern.compile("^[A-Za-z. ]+$");
			Pattern pattern1 = Pattern.compile("^[0-9]+$");
		%>
		<%
			int campoValido = 0;
			request.setCharacterEncoding("UTF-8");
			NombreCliente 	= request.getParameter("nombreCliente");
			    Matcher mather = pattern.matcher(NombreCliente);
			    if (mather.find() == true) {      
				    campoValido++;      
			    }else{
			    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo NOMBRE invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/insertClient.jsp';}else{location.href='http://localhost:8080/surtibotana/insertClient.jsp';};</script>";
			    //out.print(campoValido);
			    out.print(mensaje);
			          //out.print("El email ingresado es inválido.");
			           
			      }
			ColoniaCliente 	= request.getParameter("coloniaCliente");
			    Matcher mather1 = pattern.matcher(ColoniaCliente);
			    if (mather1.find() == true) {      
				    campoValido++;      
			    }else{
			    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo COLONIA invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/insertClient.jsp';}else{location.href='http://localhost:8080/surtibotana/insertClient.jsp';};</script>";
			    //out.print(campoValido);
			    out.print(mensaje);
			          //out.print("El email ingresado es inválido.");
			           
			      }
			CPCliente 		= request.getParameter("cpCliente");
			    Matcher mather2 = pattern1.matcher(CPCliente);
			    if (mather2.find() == true) {      
				    campoValido++;      
			    }else{
			    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo CP solo acepta numeros'); if(var1==true){location.href='http://localhost:8080/surtibotana/insertClient.jsp';}else{location.href='http://localhost:8080/surtibotana/insertClient.jsp';};</script>";
			    //out.print(campoValido);
			    out.print(mensaje);
			          //out.print("El email ingresado es inválido.");
			           
			      }
			TelefonoCliente = request.getParameter("telefonoCliente");
			    Matcher mather3 = pattern1.matcher(TelefonoCliente);
			    if (mather3.find() == true) {      
				    campoValido++;      
			    }else{
			    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo TELEFONO solo acepta numeros'); if(var1==true){location.href='http://localhost:8080/surtibotana/insertClient.jsp';}else{location.href='http://localhost:8080/surtibotana/insertClient.jsp';};</script>";
			    //out.print(campoValido);
			    out.print(mensaje);
			          //out.print("El email ingresado es inválido.");
			           
			      }
			ResponsableCliente =request.getParameter("responsableCliente");
			    Matcher mather4 = pattern.matcher(ResponsableCliente);
			    if (mather4.find() == true) {      
				    campoValido++;      
			    }else{
			    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo RESPONSABLE invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/insertClient.jsp';}else{location.href='http://localhost:8080/surtibotana/insertClient.jsp';};</script>";
			    //out.print(campoValido);
			    out.print(mensaje);
			          //out.print("El email ingresado es inválido.");
			           
			      }
			TipoProducto 	= request.getParameter("tipoProducto");
			    Matcher mather5 = pattern.matcher(TipoProducto);
			    if (mather5.find() == true) {      
				    campoValido++;      
			    }else{
			    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo TIPO PRODUCTO invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/insertClient.jsp';}else{location.href='http://localhost:8080/surtibotana/insertClient.jsp';};</script>";
			    //out.print(campoValido);
			    out.print(mensaje);
			          //out.print("El email ingresado es inválido.");
			           
			      }
			    
		%>
		<%
			if (campoValido == 6) {
				
			//int tipoProducto = Integer.parseInt(TipoProducto);
			InsertarNewClient = "INSERT INTO clientes (nombre,telefono,colonia,c_postal,responsable,tipo_producto) VALUES (?,?,?,?,?,?)";
			PreparedStatement sentencia = con.prepareStatement(InsertarNewClient);
					sentencia.setString(1,NombreCliente);
					sentencia.setString(2,TelefonoCliente);
					sentencia.setString(3,ColoniaCliente);
					sentencia.setString(4,CPCliente);
					sentencia.setString(5,ResponsableCliente);
					sentencia.setString(6,TipoProducto);
					sentencia.executeUpdate();
					sentencia.close();
			}else{
				String mensaje="<script type= 'text/javascript'>var1 = confirm('ERROR AL INSERTAR CLIENTE'); if(var1==true){location.href='http://localhost:8080/surtibotana/updateClient.jsp';}else{location.href='http://localhost:8080/surtibotana/updateClient.jsp';};</script>";
				out.print(campoValido);
				out.print(mensaje);
			}
		%>
		<br> 
		</div>
	</body>
</html>