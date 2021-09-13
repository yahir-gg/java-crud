<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" session = "true" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1); //prevents caching at the proxy server  
%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<meta http-equiv="Expires" content="0">	 
	<meta http-equiv="Last-Modified" content="0">
	<meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
	<meta http-equiv="Pragma" content="no-cache">
	<title>Gestion Surtibotana</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
	<!--con request obtengo el estado de la sesion-->
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
	<!--<nav>
		<div class="brand_image">
			<img src="" alt="">
		</div>
		<div class="nav_options">
			<ul>
				<li><a href="index.html">Inicio</a></li>
				<li><a href="">Opcion2</a></li>
			</ul>
		</div>
	</nav>-->
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
			      <li class="nav-item active">
			        <a class="nav-link" href='http://localhost:8080/surtibotana/backLogin.jsp?cerrar=true'>Cerrar sesion<span class="sr-only">(current)</span></a>
			      </li>
			      
			    </ul>
			    
			  </div>
			</div>
		</nav>
	</header>
	<!--Main-->
	<main id="mainc">
		<div class="container-hero">
			<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel"data-pasie="false">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="images/coca.jpg" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="images/barcel.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="images/pepsi.jpg" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="images/danone.jpg" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="images/boing.png" class="d-block w-100" alt="...">
			    </div>
			    <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
			        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			        <span class="sr-only">Previous</span>
			      </a>
			      <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
			        <span class="carousel-control-next-icon" aria-hidden="true"></span>
			        <span class="sr-only">Next</span>
			      </a>
			  	
			  </div>
				  
			</div>
			<div class="hero-title container" >Bienvenido <strong><%=nombre%> <%=apellido%>, </strong>gestiona tus productos, clientes, proveedores y más.</div>
		</div>
		

	</main>
	<!--/Main-->

	
	<section class="portafolio">
		
		<div class="container">
			<div class="galeria-port">
				<div class="image-port">
					<img src="images/proveedores.png" alt="">
					<div class="hover-galeria">
					<a href="menuProducts.html">
						<img src="images/icono1.png" alt="">
					</a>
						<p>Gestionar productos</p>
					</div>
				</div>
				<div class="image-port">
					<img src="images/clientes.png" alt="">
					<div class="hover-galeria">
						<a href="menuClients.html">
						<img src="images/icono1.png" alt=""></a>
						<p>Gestionar clientes</p>
					</div>
				</div>
				<div class="image-port">
					<img src="images/compra.png" alt="">
					<div class="hover-galeria">
						<a href="menuCV.html">
						<img src="images/icono1.png" alt="">
						</a>
						<p>Gestionar compras y ventas</p>
					</div>
				</div>
			</div>
		
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>