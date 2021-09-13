
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
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
	<div class="container">
		<h2>Inicia sesion</h2>
		<form id="gestion" action="backLogin_v2.jsp" method="get" onsubmit="return validar();">
			<input type="text" name="u_correo" placeholder="Ingrese su correo"><br><br>
			<input type="password" name="u_pwd" placeholder="Ingrese su contraseña"><br><br>
			<input type="submit">
		</form>
	</div>
	<script src="js/validarLogin.js"></script>
</body>
</html>