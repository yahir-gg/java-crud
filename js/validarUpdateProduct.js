function validar(){
	var tipo_producto, id_producto, sabor, tamanio, precio, almacen;
	var expression ,expression2, expression3;

	id_producto = document.getElementById("pd_id").value;
	sabor = document.getElementById("pd_sabor").value;
	tamanio = document.getElementById("pd_tamanio").value;
	precio = document.getElementById("pd_precio").value;
	almacen = document.getElementById("pd_almacen").value;
	
	expression = /^[A-Za-z\s]+$/;
	expression2 = /^[A-Za-z0-9\s]+$/;
	expression3 = /^[0-9.\s]+$/;

	//validacion de campos no vacios

	if(id_producto === "" || sabor === "" || tamanio === "" || precio === "" || almacen===""){
		alert("Todos los campos son obligatorios");
		return false;
	}
	// Validacion de caracteres no permitidos
	if (!expression3.test(id_producto)) {
		alert("Campo ID PRODUCTO solo acepta numeros.");
		return false;
	}
	if (!expression.test(sabor)) {
		alert("Campo SABOR solo acepta letras.");
		return false;
	}
	if (!expression2.test(tamanio)) {
		alert("Campo TAMAÑO invalido");
		return false;
	}
	if (!expression3.test(precio)) {
		alert("Campo PRECIO invalido");
		return false;
	}
	if (!expression3.test(almacen)) {
		alert("Campo ALMACEN invalido")
	}
	//Validacion de longitud de caracteres
	if(id_producto.length > 4){
		alert("Campo ID PRODUCTO muy largo.");
		return false;
	}
	if(sabor.length > 10){
		alert("Campo SABOR muy largo.");
		return false;
	}
	if(tamanio.length > 10){
		alert("Campo TAMAÑO muy largo.");
		return false;
	}
	if(precio.length > 6){
		alert("Campo PRECIO muy largo.");
		return false;
	}
	if (almacen.length !== 1) {
		alert("Campo ALMACEN muy largo")
	}
}