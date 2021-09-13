function validar(){
	var id_p_elimina;

	id_p_elimina = document.getElementById("id_producto_elimina").value;

	
	if (isNaN(id_p_elimina)) {
		alert("Campo invalido");
		return false;
	}

}
