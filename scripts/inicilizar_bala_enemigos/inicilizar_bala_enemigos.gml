///@arg direccion
///@arg rapidez
///@arg obj_arma
function inicializar_bala_enemigos(){
	var _direccion = argument[0];
	var _rapidez = argument[1];
	var inst = argument[2];
	with(inst){
		direction = _direccion;
		if(object_index ==obj_ballr) speed = _rapidez;

	}
}