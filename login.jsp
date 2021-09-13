<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" session = "true" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%  
	response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1); //prevents caching at the proxy server  
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Last-Modified" content="0">
	<meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
	<meta http-equiv="Pragma" content="no-cache">
	<title>Inicia Sesión</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<link rel="stylesheet" href="./css/estilos.css">
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
			        <a class="nav-link" href="index.html"><span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="menuProducts.html"></a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="menuClients.html"></a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="menuCV.html"></a>
			      </li>
			      
			    </ul>
			    
			  </div>
			</div>
		</nav>
	</header>
	<main class="container-login">
		<div class="container-title">
			<div class="title login" >Inicia sesion</div>	
		</div>
		<div class="container-form">
			<form id="gestion" action="backLogin.jsp" method="get" onsubmit="return validar();">
				<label for="u_correo">Email</label>
				<input class="inputs" type="email" id="u_correo" name="u_correo"  placeholder="Ingrese su correo" ><br><br>
				<label for="u_pwd">Contraseña</label>
				<input type="password" class="inputs" id="u_pwd" name="u_pwd"  placeholder="Ingrese su contraseña"  ><br><br>
				<div class="enlaces">
					<a href="#">¿Olvidaste tu contraseña?</a>	
				</div>
				<input id="btn_is" class="btn" class="inputs" type="submit" value="Iniciar Sesión">
				<div class="enlaces registrate">
					<a id="a-registrate" href="#">Registrate</a>
				</div>
		</form>	
		</div>
	</main>
	<script src="js/validarLogin.js"></script>
</body>
</html>

