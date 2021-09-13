<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.Matcher"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="es-MX" >
	<head>
		<title>Actualizar producto</title>
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
			ResultSet rs1;
			String dburl="jdbc:postgresql://localhost:5432/surtibotana";
			String user="write_user";
			String password="mfs293";
			String USabor="";
			String UTamanio="";
			String UPrecio="";
			String UAlmacen="";
			String id_pd_st="";	
			//String url_actual = "";
		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
			String update ="";
		%>
		<%
			Pattern pattern = Pattern.compile("^[A-Za-z]+$");
			Pattern pattern1 = Pattern.compile("^[A-Za-z0-9]+$");
			Pattern pattern2 = Pattern.compile("^[0-9.]+$");
		%>
		<%
		int campoValido = 0;
		request.setCharacterEncoding("UTF-8");
		
		id_pd_st	= request.getParameter("pd_id");
		    Matcher mather0 = pattern2.matcher(id_pd_st);
		    if (mather0.find() == true) {      
			    campoValido++;      
		    }else{
		          //out.print("El email ingresado es inválido.");
		           
		      }
		
		USabor	= request.getParameter("pd_sabor");
		
		    Matcher mather = pattern.matcher(USabor);
		    if (mather.find() == true) {      
			    campoValido++;      
		    }else{
		          //out.print("El email ingresado es inválido.");
		           
		      }
		    
		UTamanio	= request.getParameter("pd_tamanio");
	
		    Matcher mather1 = pattern1.matcher(UTamanio);
		    if (mather1.find() == true) {      
			    campoValido++;      
		    }else{
		          //out.print("El email ingresado es inválido.");
		          
		      }
		    
		UPrecio	= request.getParameter("pd_precio");
		
		    Matcher mather2 = pattern2.matcher(UPrecio);
		    if (mather2.find() == true) {      
			    campoValido++;      
		    }else{
		          //out.print("El email ingresado es inválido.");
		          
		      }
		    //3
		UAlmacen	= request.getParameter("pd_almacen");
		    Matcher mather3 = pattern2.matcher(UAlmacen);
		    if (mather2.find() == true) {      
			    campoValido++;      
		    }else{
		          //out.print("El email ingresado es inválido.");
		          
		      }
		//4
		
		//Generando la actualización con el nombre dado en el formulario
		
		%>
		
		<%
			if (campoValido == 5) {
				int id_al = Integer.parseInt(UAlmacen);
				int id_pd_int = Integer.parseInt(id_pd_st);
				double d_uprecio = Double.parseDouble(UPrecio);
				update = "UPDATE productos set sabor = ?, tamanio =?, precio_unitario =?, id_almacen=? WHERE id_producto = ?" ;
				PreparedStatement sentencia = con.prepareStatement(update);
				sentencia.setString(1,USabor);
				sentencia.setString(2,UTamanio);
				sentencia.setDouble(3,d_uprecio);
				sentencia.setInt(4,id_al);
				sentencia.setInt(5,id_pd_int);
				sentencia.executeUpdate();
				sentencia.close();
				response.sendRedirect("http://localhost:8080/surtibotana/success.html");
				//stmt.executeUpdate(update);


			}else{
				String mensaje="<script type= 'text/javascript'>var1 = confirm('Datoss invalidos. Intenta de nuevo'); if(var1==true){location.href='http://localhost:8080/surtibotana/updateProduct.jsp';}else{location.href='http://localhost:8080/surtibotana/updateProduct.jsp';};</script>";
				out.print(campoValido);
				out.print(mensaje);
				response.sendRedirect("http://localhost:8080/surtibotana/failed.html");
			}
				con.close(); //Cerrando conexión con el servidor de Base de Datos
		%>
		
		</div>
	</body>
</html>