///@description create_bullet
///@arg direccion
///@arg rapidez
///@arg escuadron
///@arg tipo_arma*
function crear_arma(){
	var _direccion = argument[0];
	var _rapidez = argument[1];
	var _escuadron = argument[2];
	
	
	var _tipo_arma = -1;
	if(argument_count > 3) _tipo_arma = argument[3];
	
	/// CHOOSE GUN TYPE
	switch(_tipo_arma){
		case POTENCIADORES.TRES_BALAS:
			var inst = instance_create_layer(x,y,"Instances",obj_shuriken);
			inicializar_bala(_direccion,_rapidez,_escuadron,inst);
			
		case POTENCIADORES.DOS_BALAS:
			//audio_play_sound(snd_laser,1,false);
			
			var _sep = 12;
			var inst = instance_create_layer(x+lengthdir_x(_sep,_direccion+90),y+lengthdir_y(_sep,_direccion+90),"Instances",obj_shuriken);
			inicializar_bala(_direccion,_rapidez,_escuadron,inst);
			
			var inst = instance_create_layer(x+lengthdir_x(_sep,_direccion-90),y+lengthdir_y(_sep,_direccion-90),"Instances",obj_shuriken);
			inicializar_bala(_direccion,_rapidez,_escuadron,inst);
			break;

		
		case POTENCIADORES.CUATRO_BALAS:
			//audio_play_sound(snd_laser,1,false);
			
			var _sep = 7, angulo_bala;
			var i = 0; repeat(4){
				angulo_bala = _direccion + (i * 90);
				var inst = instance_create_layer(
				x+lengthdir_x(_sep,angulo_bala),
				y+lengthdir_y(_sep,angulo_bala),
				"Instances",obj_shuriken);
				inicializar_bala(angulo_bala,_rapidez,_escuadron,inst);
				i++; //incrementar todo el tiempo
			}
			break;
		case POTENCIADORES.ESTRELLA_BALAS:
			//audio_play_sound(snd_laser,1,false);
			
			var _sep = 7, angulo_bala;
			var i = 0; repeat(8){
				angulo_bala = _direccion + (i * 45);
				var inst = instance_create_layer(
				x+lengthdir_x(_sep,angulo_bala),
				y+lengthdir_y(_sep,angulo_bala),
				"Instances",obj_shuriken);
				inicializar_bala(angulo_bala,_rapidez,_escuadron,inst);
				i++; //incrementar todo el tiempo
			}
			break;
		case POTENCIADORES.LASER:
			//audio_play_sound(snd_lasers,1,false);
			var inst = instance_create_layer(x,y,"Instances",obj_laser);
			inicializar_bala(_direccion,_rapidez,_escuadron,inst);
			break;
		default:		
			//audio_play_sound(snd_laser,1,false);
			var inst = instance_create_layer(x,y,"Instances",obj_shuriken);
			inicializar_bala(_direccion,_rapidez,_escuadron,inst);

			break;			
	}
}





