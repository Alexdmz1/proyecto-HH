///@description create_bullet
///@arg direccion
///@arg rapidez
///@arg tipo_arma*
function crear_bala_enemigos(){
	var _direccion = argument[0];
	var _rapidez = argument[1];
	var _tipo_arma = -1;
	if(argument_count > 2) _tipo_arma = argument[2];
	
	
	//audio_play_sound(snd_laser,1,false);
	var _sep = 7, angulo_bala;
	var i = 0; repeat(8){
		angulo_bala = _direccion + (i * 45);
		var inst = instance_create_layer(
		x+lengthdir_x(_sep,angulo_bala),
		y+lengthdir_y(_sep,angulo_bala),
		"Instances",obj_ballr);
		inicializar_bala_enemigos(angulo_bala,_rapidez,inst);
		i++; //incrementar todo el tiempo
	}


}