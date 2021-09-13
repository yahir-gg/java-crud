<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.Matcher"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="es-MX" >
	<head>
		<title>Añadir producto</title>
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
			String AddSabor="";
			String AddTamanio="";
			String AddPrecio="";
			String AddTipoProducto="";
			String AddIDmarca="";
			String AddAlmacen="";
			String AddCantidad="";
			int CantidadDisponible=0;
			int aux=0;
		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
			String addpd ="";
			String query="";
		%>
		<%
			Pattern pattern = Pattern.compile("^[A-Za-z ]+$");
			Pattern pattern1 = Pattern.compile("^[A-Za-z0-9.]+$");
			Pattern pattern2 = Pattern.compile("^[0-9.]+$");
		%>
		<%
		int campoValido = 0;
		request.setCharacterEncoding("UTF-8");
		AddSabor	= request.getParameter("pd_sabor");
		    Matcher mather = pattern.matcher(AddSabor);
		    if (mather.find() == true) {      
			    campoValido++;      
		    }else{
		    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo SABOR invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/insertProduct.jsp';}else{location.href='http://localhost:8080/surtibotana/insertProduct.jsp';};</script>";
		    //out.print(campoValido);
		    out.print(mensaje);
		          //out.print("El email ingresado es inválido.");
		           
		      }
		AddTamanio	= request.getParameter("pd_tamanio");
		    Matcher mather1 = pattern1.matcher(AddTamanio);
		    if (mather1.find() == true) {      
			    campoValido++;      
		    }else{
		    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo TAMAÑO invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/insertProduct.jsp';}else{location.href='http://localhost:8080/surtibotana/insertProduct.jsp';};</script>";
		    //out.print(campoValido);
		    out.print(mensaje);
		          //out.print("El email ingresado es inválido.");
		           
		      }
		AddPrecio	= request.getParameter("pd_precio");
		    Matcher mather2 = pattern2.matcher(AddPrecio);
		    if (mather2.find() == true) {      
			    campoValido++;      
		    }else{
		    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo PRECIO invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/insertProduct.jsp';}else{location.href='http://localhost:8080/surtibotana/insertProduct.jsp';};</script>";
		    //out.print(campoValido);
		    out.print(mensaje);
		          //out.print("El email ingresado es inválido.");
		           
		      }
		AddTipoProducto	= request.getParameter("pd_tipo_p");
		AddIDmarca	= request.getParameter("pd_id_marca");
		AddAlmacen	= request.getParameter("pd_almacen");
		    Matcher mather3 = pattern2.matcher(AddAlmacen);
		    if (mather3.find() == true) {      
			    campoValido++;      
		    }else{
		    String mensaje="<script type= 'text/javascript'>var1 = confirm('Campo ALMACEN invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/insertProduct.jsp';}else{location.href='http://localhost:8080/surtibotana/insertProduct.jsp';};</script>";
		    //out.print(campoValido);
		    out.print(mensaje);
		          //out.print("El email ingresado es inválido.");
		           
		      }
		AddCantidad	= request.getParameter("pd_cant");
		//int i_cant = Integer.parseInt(AddCantidad);
		//int i_cant = i_cant + CantidadDisponible;
		//Generando la actualización con el nombre dado en el formulario
		
		%>
		<%
		if (campoValido == 4) {
		
		int i_id_marca = Integer.parseInt(AddIDmarca);
		int i_id_prod = Integer.parseInt(AddTipoProducto);
		int i_id_alm = Integer.parseInt(AddAlmacen);
		Double d_precio= Double.parseDouble(AddPrecio);
			
		query = "SELECT id_producto FROM productos WHERE sabor = ? and tamanio =? and id_marca=?";
		PreparedStatement sentencia = con.prepareStatement(query);
		sentencia.setString(1,AddSabor);
		sentencia.setString(2,AddTamanio);
		sentencia.setInt(3,i_id_marca);
		sentencia.executeQuery();
		sentencia.close();

		addpd = "INSERT INTO productos (sabor,tamanio,precio_unitario,id_tipo_prod,id_marca,id_almacen) VALUES(?,?,?,?,?,?)" ;
		PreparedStatement sentencia1 = con.prepareStatement(addpd);
		sentencia1.setString(1,AddSabor);
		sentencia1.setString(2,AddTamanio);
		sentencia1.setDouble(3,d_precio);
		sentencia1.setDouble(4,i_id_prod);
		sentencia1.setDouble(5,i_id_marca);
		sentencia1.setInt(6,i_id_alm);
		sentencia1.executeUpdate();
		sentencia1.close();
		response.sendRedirect("http://localhost:8080/surtibotana/success.html");
		}else{
		response.sendRedirect("http://localhost:8080/surtibotana/failed.html");
	}
		%>
		</div>
	</body>
</html>