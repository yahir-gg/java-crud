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
			String dburl="jdbc:postgresql://localhost:5432/surtibotana";
			String user="write_user";
			String password="mfs293";
			String GetSabor="";
			String GetTamanio="";
			int GetActCant;
			String CantIng;
			int aux=0;
			int new_cant=0;
			String AddIDmarca="";
		%>
		<% Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(dburl,user,password);
			stmt = con.createStatement();
			String update ="";
			String query ="";
			String query2 ="";
			String query3 ="";
		%>
		<%
			Pattern pattern = Pattern.compile("^[A-Za-z]+$");
			Pattern pattern1 = Pattern.compile("^[A-Za-z0-9]+$");
			Pattern pattern2 = Pattern.compile("^[0-9.]+$");
		%>
		<%
		request.setCharacterEncoding("UTF-8");
		int campoValido = 0;
		GetSabor	= request.getParameter("pd_sabor");
		GetTamanio	= request.getParameter("pd_tamanio");
		AddIDmarca	= request.getParameter("pd_id_mc");
		CantIng	= request.getParameter("pd_cant");
		    Matcher mather = pattern2.matcher(CantIng);
		    if (mather.find() == true) {      
			    campoValido++;      
		    }else{
		          //out.print("El email ingresado es inválido.");
		           
		      }
		int i_id_marca = Integer.parseInt(AddIDmarca);
		int i_cant_ing = Integer.parseInt(CantIng);
		
		
		
		//Generando la actualización con el nombre dado en el formulario
		query = "SELECT id_producto FROM productos WHERE sabor = '"+GetSabor+"' and tamanio ='"+GetTamanio+"' and id_marca="+i_id_marca+" ";
		//out.println(query);	
		
		
			//rs=stmt.executeQuery(update);
		%>

		<%
		//aux=0;
			rs=stmt.executeQuery(query);
			while (rs.next()) {
					String s = rs.getString("id_producto");
					aux = Integer.parseInt(s);
			}
			if (aux==0) {
				//out.print(aux);
				//stmt.executeUpdate(addpd);
				//con.close();
			}else{
				//out.print(aux);
				
					
				//response.sendRedirect("http://www.lineadecodigo.com/");
			}
			//con.close(); //Cerrando conexión con el servidor de Base de Datos
		%>
		<%
			query2 = "SELECT cantidad_ingresar FROM productos WHERE id_producto = "+aux+"";
			//out.println(query2);
			rs=stmt.executeQuery(query2);
			while (rs.next()) {
					String z = rs.getString("cantidad_ingresar");
					GetActCant = Integer.parseInt(z);
			}
			//out.print("c:"+GetActCant);
			//out.print("c_i:"+i_cant_ing);
			new_cant = GetActCant + i_cant_ing;
			//out.print("nc:"+new_cant);

		%>
		<%
			if (campoValido == 1) {
				
			query3 = "UPDATE productos SET cantidad_ingresar = ? WHERE id_producto="+aux+"";
			PreparedStatement sentencia = con.prepareStatement(query3);
			sentencia.setInt(1,new_cant);
			sentencia.executeUpdate();
			sentencia.close();
			//out.println(query3);
			//stmt.executeUpdate(query3);
			}else{
				String mensaje="<script type= 'text/javascript'>var1 = confirm('Datoss invalidos. Intenta de nuevo'); if(var1==true){location.href='http://localhost:8080/surtibotana/updateProduct.jsp';}else{location.href='http://localhost:8080/surtibotana/updateProduct.jsp';};</script>";
				out.print(campoValido);
				out.print(mensaje);
			}
				con.close();
		%>
		<span ><strong>Mercancia ingresada correctamente</strong> </span> <br><br>
		</div>
	</body>
</html>