function validar(){
	var nombre;

	nombre = document.getElementById("nombreCliente").value;

	var expression = /^[A-Za-z\s]+$/;

	if (!expression.test(nombre)) {
		alert("Campo invalido");
		return false;
	}

}