/// @description 

with(other){
	var tipo_potenciador = image_index;
	instance_destroy();
}

switch(tipo_potenciador){
	case POTENCIADORES.INVISIBLE:
		// hacer player invisible
		invisible = true;
		alarm[1] = 8 *room_speed;
		break;
		
	default:
		// cambiar pistola al jugador
		arma = tipo_potenciador;
		alarm[0] = 5 *room_speed
		break;
}
