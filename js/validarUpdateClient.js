function validar(){
	var id_cliente, nombre, colonia, codigo_postal, numtel, responsable, tipo_producto, expression;

	id_cliente = document.getElementById("sd_id").value;
	nombre = document.getElementById("sd_nombre").value;
	colonia = document.getElementById("sd_colonia").value;
	codigo_postal = document.getElementById("sd_cpostal").value;
	numtel = document.getElementById("sd_telefono").value;
	responsable = document.getElementById("sd_responsable").value;
	tipo_producto = document.getElementById("sd_tipo_producto").value;
	expression = /^[A-Za-z\s]+$/;

	//Verificacion de campos no vacios
	if(id_cliente ==="" || nombre === "" || colonia === "" || codigo_postal === "" || numtel === "" || responsable === "" || tipo_producto === ""){
		alert("Todos los campos son obligatorios");
		return false;
	}
	//Verificacion de caracteres no permitidos
	if (!expression.test(nombre)) {
		alert("Campo NOMBRE solo acepta letras.");
		return false;
	}
	if (!expression.test(colonia)) {
		alert("Campo COLONIA solo acepta letras.");
		return false;
	}
	if (!expression.test(responsable)) {
		alert("Campo RESPONSABLE solo acepta letras.");
		return false;
	}
	if (!expression.test(tipo_producto)) {
		alert("Campo TIPO DE PRODUCTO solo acepta letras.");
		return false;
	}
	if(isNaN(id_cliente)){
		alert("Campo ID CLIENTE solo acepta numeros");
		return false;
	}
	if(isNaN(codigo_postal)){
		alert("Campo CODIGO POSTAL solo acepta numeros");
		return false;
	}
	if(isNaN(numtel)){
		alert("Campo TELEFONO solo acepta numeros");
		return false;
	}
	//Verificacion de longitud de caracteres
	if (id_cliente.length > 3) {
		alert("Campo ID CLIENTE muy largo");
		return false;
	}
	if(nombre.length > 30){
		alert("Campo NOMBRE debe ser maximo 30 caracteres.");
		return false;
	}
	if(colonia.length > 20){
		alert("Campo COLONIA debe ser maximo 20 caracteres.");
		return false;
	}
	if(codigo_postal.length !== 5){
		alert("Campo CODIGO POSTAL debe ser de 5 numeros.");
		return false;
	}
	if(numtel.length !== 10){
		alert("Campo TEELFONO debe ser de 10 numeros.");
		return false;
	}
	if(responsable.length > 30){
		alert("Campo RESPONSABLE debe ser maximo 30 caracteres.");
		return false;
	}
	if(tipo_producto.length > 20){
		alert("Campo TIPO DE PRODUCTO debe ser maximo 20 caracteres.");
		return false;
	}
}