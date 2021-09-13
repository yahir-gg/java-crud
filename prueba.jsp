<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
	<%! Connection con;
		Statement stmt;
		ResultSet rs;
		String dburl="jdbc:postgresql://localhost:5432/surtibotana";
		String user="postgres";
		String password=" ";
		int casti;
		int id_m;
		Integer id_pd=0;
		String Rpd="";
		String Rpd_tam="";
		String Rpd_t_id="";
		String Rpd_t_pr="";
		String Rpd_t_tipo_pd="";
		String Rpd_t_id_mc="";
		String Rpd_t_al="";

	%>
	<% Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection(dburl,user,password);
		stmt = con.createStatement();
		String query ="";
		String query2 ="";
		String query3="";
		String query4="";
		String query5="";
		String query6="";
		String query7="";
		String Rseleccion="";
		String Rid_tipo_prod="";
		String Rmarca="";
		String Uid="";
		//frutas = new String[100]:
		
	%>

	<!--Cosulta tipos de productos--------------------------------------------------------->
	<%
		query = "select * from tipo_productos";
		rs=stmt.executeQuery(query);
	%>
	<form id="form_show_tp" action="prueba.jsp" method="get">
		<label>Selecciona el tipo de producto</label><br>
		
			<%
				while (rs.next()) {
				Rid_tipo_prod= rs.getString("id_tipo_prod");
				Rseleccion = rs.getString("tipo");
			%>
			<input type="checkbox" name="frutas" value="<%=Rid_tipo_prod%>" selected=""><%=Rid_tipo_prod%><br>
			<%
				}
			%>
		
		<input type="submit" value="consultar">
	</form>

	<%
		String [] frutas = request.getParameterValues("frutas");
	%>
	<%	
		if(frutas!=null){
		try {
		 	out.print("try:"+frutas.length);
		  	for(int i=0; i<frutas.length;i++){
		  		id_m = Integer.parseInt(frutas[i]);
				query2 = "insert into ventas (fecha,id_cliente) values ((select current_date),"+2+")";
		  		stmt.executeUpdate(query2);
		  		//out.print(query2); 
		  	}
		
		} catch(NumberFormatException nfe) {
			
			out.print(frutas.length);
			for(int i=0; i<frutas.length;i++){
			
				query2 = "insert into ticket (id_venta,id_producto) values (1,"+id_m+")";
				//stmt.executeUpdate(query2);
				out.print(query2); 
			}
		}
		}else{

			}
	%>
	
		
	
</body>
</html>