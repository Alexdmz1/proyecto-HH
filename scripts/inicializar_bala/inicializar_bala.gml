///@description inicializar_bala
///@arg direccion
///@arg rapidez
///@arg escuadron
///@arg obj_arma
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inicializar_bala(){

	var _direccion = argument[0];
	var _rapidez = argument[1];
	var _escuadron = argument[2];
	var _creador = id;
	var inst = argument[3];
	with(inst){
		direction = _direccion;
		if(object_index ==obj_shuriken ||object_index==obj_laser) speed = _rapidez;
		escuadron = _escuadron;
		creador = _creador;
		if(escuadron == ESCUADRON.ALIADOS) image_blend = c_aqua;
		else if(escuadron ==ESCUADRON.ENEMIGOS) image_blend = c_red;
	}

}





