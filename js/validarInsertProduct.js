function validar(){
	var marca, id_marca, tipo_producto, sabor, tamanio, precio, almacen, expression;

	marca = document.getElementById("pd_marca").value;
	id_marca = document.getElementById("pd_id_marca").value;
	tipo_producto = document.getElementById("pd_tipo_p").value;
	sabor = document.getElementById("pd_sabor").value;
	tamanio = document.getElementById("pd_tamanio").value;
	precio = document.getElementById("pd_precio").value;
	almacen = document.getElementById("pd_almacen").value;
	expression = /^[A-Za-z\s]+$/;
	expression2 = /^[A-Za-z0-9.\s]+$/;
	expression3 = /^[0-9.\s]+$/;

	//Verificacion de campos no vacios
	if(marca === "" || id_marca === "" || tipo_producto === "" || sabor === "" || tamanio === "" || precio === "" || almacen === ""){
		alert("Todos los campos son obligatorios");
		return false;
	}
	//Verificacion de caracteres no permitidos
	if (!expression.test(marca)) {
		alert("Campo MARCA solo acepta letras.");
		return false;
	}
	if(isNaN(id_marca)){
		alert("Campo ID MARCA invalido");
		return false;
	}
	if(!expression3.test(tipo_producto)){
		alert("Campo TIPO DE PRODUCTO solo acepta numeros");
		return false;
	}
	if(!expression.test(sabor)){
		alert("Campo SABOR solo acepta numeros");
		return false;
	}
	if (!expression2.test(tamanio)) {
		alert("Campo TAMAÑO invalido.");
		return false;
	}
	if (!expression3.test(precio)) {
		alert("Campo PRECIO invalido.");
		return false;
	}
	if(isNaN(almacen)){
		alert("Campo ALMACEN solo acepta numeros");
		return false;
	}
	
	
	//Verificacion de longitud de caracteres
	if (id_marca.length > 4) {
		alert("Campo ID MARCA muy largo");
	}
	if(marca.length > 20){
		alert("Campo MARCA debe ser maximo 20 caracteres.");
		return false;
	}
	if(tipo_producto.length > 2){
		alert("Campo TIPO DE PRODUCTO invalido.");
		return false;
	}
	if(sabor.length > 10){
		alert("Campo SABOR muy largo.");
		return false;
	}
	if(tamanio.length > 10){
		alert("Campo TAMAÑO muy largo");
		return false;
	}
	if(precio.length > 6){
		alert("Campo PRECIO invalido.");
		return false;
	}
	if (almacen.length !== 1) {
		alert("Campo ALMACEN invalido")
	}
}