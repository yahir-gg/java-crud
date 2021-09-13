<!--conexion a BD-->
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" session = "true" %>
<%@ page import="java.util.regex.Matcher"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!--evitar cache-->
<%  
	response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
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
</head>
<body>
	<!--conexion a BD-->
	<%! Connection con;
		Statement stmt;
		ResultSet rs;
		ResultSet rs1;
		String dburl="jdbc:postgresql://localhost:5432/surtibotana";
		String user="postgres";
		String password="abc";
		String userName="";
		String userPwd="";
		String nombre="";
		String apellido="";
		int privilegio;
	%>
	<% Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection(dburl,user,password);
		stmt = con.createStatement();
		String query="";
		String query2="";
		String aux_enc="";
		String pwd_desenc="";
		Boolean emailValido = false;
		Boolean passwordValido = false;
	%>
	<!--Recuperacion de correo y contrasena del login-->
	<%
		request.setCharacterEncoding("UTF-8");
		userName=request.getParameter("u_correo");
		userPwd=request.getParameter("u_pwd");
	%>
	<%
		Pattern pattern = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
		
		Pattern pattern1 = Pattern.compile("^[A-Za-z0-9_-]+$");
		 
		try {
		    Matcher mather = pattern.matcher(userName);
		    if (mather.find() == true) {
		          
			    emailValido = true;      
		    }else{
		          //out.print("El email ingresado es inválido.");
		          String mensaje="<script type= 'text/javascript'>var1 = confirm('Correo invalido'); if(var1==true){location.href='http://localhost:8080/surtibotana/login.jsp';}else{location.href='http://localhost:8080/surtibotana/login.jsp';};</script>";
		      	//response.sendRedirect("http://localhost:8080/surtibotana/login.jsp");
		      		out.println(mensaje); 
		      }
		    } catch (Exception e) {
		    	session.removeAttribute("misesion");
				session.removeAttribute("n_user");
				session.removeAttribute("a_user");
				session.removeAttribute("priv_user");
				session.invalidate();
				response.sendRedirect("http://localhost:8080/surtibotana/login.jsp");
		    }
		    try {
		        Matcher mather1 = pattern1.matcher(userPwd);
		        if (mather1.find() == true) {
		              
		    	    passwordValido = true;      
		        }else{
		              //out.print("El email ingresado es inválido.");
		              String mensaje="<script type= 'text/javascript'>var1 = confirm('Contrasena invalida'); if(var1==true){location.href='http://localhost:8080/surtibotana/login.jsp';}else{location.href='http://localhost:8080/surtibotana/login.jsp';};</script>";
		          	//response.sendRedirect("http://localhost:8080/surtibotana/login.jsp");
		          		out.println(mensaje); 
		          }
		        } catch (Exception e) {
		        	
		        }
	%>
	<%
	if (emailValido == true && passwordValido == true) {
		
		query = "SELECT COUNT(NAME) FROM USERS WHERE email=?";
		PreparedStatement sentencia = con.prepareStatement(query);
		sentencia.setString(1,userName);
		rs = sentencia.executeQuery();
		rs.next();
		int n = rs.getInt(1);
		//si n == 1 hay email registrado
		if (n==1) {
			aux_enc = "select pgp_sym_decrypt(password::bytea,'AES_KEY') from users where email = '"+userName+"'";
			/*sentencia.setString(1,userName);
			rs = sentencia.executeQuery();*/
			rs=stmt.executeQuery(aux_enc);
			rs.next();
			pwd_desenc = rs.getString(1);
			if(pwd_desenc.equals(userPwd)){
				//si n == 2 las contraseñas son iguales y da acceso al sistema
				n=2;
				query2 = "SELECT * FROM USERS WHERE EMAIL = ?";
				PreparedStatement sentencia1 = con.prepareStatement(query2);
				sentencia1.setString(1,userName);
				
				rs1=sentencia1.executeQuery();
				
					while(rs1.next()){
						nombre = rs1.getString("name");
						apellido = rs1.getString("last_name");
						privilegio = rs1.getInt("privilege");
					}
			}else{

			    String mensaje="<script type= 'text/javascript'>var1 = confirm('Contraseña incorrecta. Intenta de nuevo'); if(var1==true){location.href='http://localhost:8080/surtibotana/login.jsp';}else{location.href='http://localhost:8080/surtibotana/login.jsp';};</script>";
						//response.sendRedirect("http://localhost:8080/surtibotana/login.jsp");
				out.println(mensaje);
				}		
			}
		//si n == 2 y no hay sesion: ya se permitio acceso al sistema y se crea la sesion
		//si n == 2 y ya hay sesion: se redirecciona al index
		//si n == 0: no hay coincidencias de usuario, se va al login
		//si n == 1: hay usuario pero no constraseña
		if (n==2 && session.getAttribute("misesion")== null){
			//HttpSession session = request.getSession();
			session.setAttribute("misesion",userName);
			session.setAttribute("n_user",nombre);
			session.setAttribute("a_user",apellido);
			session.setAttribute("priv_user",privilegio);
			//session.setAttribute("last_name",);
			String n_session = session.getId();
			out.print(n_session);
			response.sendRedirect("http://localhost:8080/surtibotana/index.jsp");
		}else if (n==2 && session.getAttribute("misesion")!= null){
			response.sendRedirect("http://localhost:8080/surtibotana/index.jsp");
		}else if(n==0){
			
			response.sendRedirect("http://localhost:8080/surtibotana/login.jsp");
		}else if(n==1){
			response.sendRedirect("http://localhost:8080/surtibotana/login.jsp");
		}

		//si la variables cerrar es diferente de null quito atributos y elimino sesion
		if( request.getParameter("cerrar")!=null){
			session.removeAttribute("misesion");
			session.removeAttribute("n_user");
			session.removeAttribute("a_user");
			session.removeAttribute("priv_user");
			session.invalidate();

		}	
		con.close(); //nunca olvidar cerrar nuestra conexión
	}
	%>
	
</body>
</html>