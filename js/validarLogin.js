function validar(){
	var email, password, expression;

	email = document.getElementById("u_correo").value;
	password = document.getElementById("u_pwd").value;

	if(email === "" || password === ""){
		alert("Todos los campos son obligatorios");
		return false;
	}
	if(email.length > 30 || password.length > 30){
		alert("Usuario y Contraseña muy largos");
		return false;
	}
	/*if(isNaN(variable)){
		alert("No es numero");
		return false;
	}*/
	expression = /\w+@+\w+\.+[a-z]/;
	if (!expression.test(email)) {
		alert("El correo no es valido.");
		return false;
	}
}
