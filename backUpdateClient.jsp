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
			String user="write_user";
			String password="mfs293";
			String UpdateNombre="";
			String UpdateTelefono="";
			String UpdateColonia="";
			String UpdateCPostal="";
			String UpdateEncargado="";
			String UpdateTipoProducto="";
			String Updateid="";
			int id_c;
		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
			String update ="";
		%>
		<%
			Pattern pattern = Pattern.compile("^[A-Za-z. ]+$");
			Pattern pattern1 = Pattern.compile("^[0-9]+$");
		%>
		<%
		int campoValido = 0;
		request.setCharacterEncoding("UTF-8");
		Updateid	= request.getParameter("sd_id");
		    Matcher mather0 = pattern1.matcher(Updateid);
		    if (mather0.find() == true) {      
			    campoValido++;      
		    }else{
		    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo ID invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/updateClient.jsp';}else{location.href='http://localhost:8080/surtibotana/updateClient.jsp';};</script>";
		    //out.print(campoValido);
		    out.print(mensaje);
		          //out.print("El email ingresado es inválido.");
		           
		      }
		UpdateNombre	= request.getParameter("sd_nombre");
		    Matcher mather = pattern.matcher(UpdateNombre);
		    if (mather.find() == true) {      
			    campoValido++;      
		    }else{
		    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo NOMBRE invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/updateClient.jsp';}else{location.href='http://localhost:8080/surtibotana/updateClient.jsp';};</script>";
		    //out.print(campoValido);
		    out.print(mensaje);
		          //out.print("El email ingresado es inválido.");
		           
		      }
		UpdateTelefono	= request.getParameter("sd_telefono");
		    Matcher mather1 = pattern1.matcher(UpdateTelefono);
		    if (mather1.find() == true) {      
			    campoValido++;      
		    }else{
		    	String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo TELEFONO invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/updateClient.jsp';}else{location.href='http://localhost:8080/surtibotana/updateClient.jsp';};</script>";
		    	//out.print(campoValido);
		    	out.print(mensaje);
		          //out.print("El email ingresado es inválido.");
		           
		      }
		UpdateColonia	= request.getParameter("sd_colonia");
		    Matcher mather2 = pattern.matcher(UpdateColonia);
		    if (mather2.find() == true) {      
			    campoValido++;      
		    }else{
		    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo COLONIA invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/updateClient.jsp';}else{location.href='http://localhost:8080/surtibotana/updateClient.jsp';};</script>";
		    //out.print(campoValido);
		    out.print(mensaje);
		          //out.print("El email ingresado es inválido.");
		           
		      }
		UpdateCPostal	= request.getParameter("sd_cpostal");
		    Matcher mather3 = pattern1.matcher(UpdateCPostal);
		    if (mather3.find() == true) {      
			    campoValido++;      
		    }else{
		    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo CP invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/updateClient.jsp';}else{location.href='http://localhost:8080/surtibotana/updateClient.jsp';};</script>";
		    //out.print(campoValido);
		    out.print(mensaje);
		          //out.print("El email ingresado es inválido.");
		           
		      }
		UpdateEncargado	= request.getParameter("sd_responsable");
		    Matcher mather4 = pattern.matcher(UpdateEncargado);
		    if (mather4.find() == true) {      
			    campoValido++;      
		    }else{
		          //out.print("El email ingresado es inválido.");
		         String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo ENCARGADO invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/updateClient.jsp';}else{location.href='http://localhost:8080/surtibotana/updateClient.jsp';};</script>";
		         //out.print(campoValido);
		         out.print(mensaje);  
		      }
		UpdateTipoProducto	= request.getParameter("sd_tipo_producto");
		    Matcher mather5 = pattern.matcher(UpdateTipoProducto);
		    if (mather5.find() == true) {      
			    campoValido++;      
		    }else{
		          //out.print("El email ingresado es inválido.");
		        String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo TIPO PRODUCTO invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/updateClient.jsp';}else{location.href='http://localhost:8080/surtibotana/updateClient.jsp';};</script>";
		        //out.print(campoValido);
		        out.print(mensaje);   
		      }
		id_c = Integer.parseInt(Updateid);
		//Generando la actualización con el nombre dado en el formulario
		if (campoValido == 7) {
			
		update = "UPDATE clientes set nombre = ?, telefono =?, colonia=?, c_postal=?,responsable=?,tipo_producto=? WHERE id_cliente = ?" ;
		PreparedStatement sentencia = con.prepareStatement(update);
				sentencia.setString(1,UpdateNombre);
				sentencia.setString(2,UpdateTelefono);
				sentencia.setString(3,UpdateColonia);
				sentencia.setString(4,UpdateCPostal);
				sentencia.setString(5,UpdateEncargado);
				sentencia.setString(6,UpdateTipoProducto);
				sentencia.setInt(7,id_c);
				sentencia.executeUpdate();
				sentencia.close(); //Cerrando conexión con el servidor de Base de Datos
				response.sendRedirect("http://localhost:8080/surtibotana/success.html");
		}else{
				String mensaje="<script type= 'text/javascript'>var1 = confirm('Error al actualizar cliente'); if(var1==true){location.href='http://localhost:8080/surtibotana/updateClient.jsp';}else{location.href='http://localhost:8080/surtibotana/updateClient.jsp';};</script>";
				out.print(campoValido);
				out.print(mensaje);
				response.sendRedirect("http://localhost:8080/surtibotana/failed.html");
			}
		%>
		<!--<h2><strong>Datos actualizados correctamente</strong> </h2> <br><br>
		<button id="regresarVentas"><a href=menuClients.html>Regresar a productos</a></button>-->
		</div>
	</body>
</html>