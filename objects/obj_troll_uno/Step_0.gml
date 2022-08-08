/// @description movimientos

// definir direccion

if(!instance_exists(obj_jugador)) exit;


if hspeed = derecha{
	direccion = 0;
}

if hspeed = izquierda{
	direccion = 1;
}
// parametros collision
if not place_free(x+10,y){
	hspeed =izquierda;
	direccion = 1;
}
if not place_free(x-10,y){
	hspeed =derecha;
	direccion = 0;
}


if direccion = 0{
	image_xscale = 1;

} 
else{

	image_xscale = -1;

}
// gravedad
if place_free(x,y+1){
	gravity =1;
}else{
	gravity= 0;
}

  



#region// seguir al player
// if player exist


if place_meeting(x-300,y,obj_jugador) || place_meeting(x+300,y,obj_jugador)
{
	detectar=1;
}else{detectar=0;}

if(detectar==1)
{
	if(x>obj_jugador.x)
	{
		
		image_xscale=-1;
		if(point_distance(x,y,obj_jugador.x,obj_jugador.y) <250)
		{
			sprite_index= spr_troll_ataque;
			hspeed=0;

			
			
		}
		else
		{
			sprite_index= spr_troll_caminar;
			hspeed =izquierda;
			direccion=1;
			detectar=0;
			
		}
	}
	if(x<obj_jugador.x)
	{
		image_xscale=1;
		if(point_distance(x,y,obj_jugador.x,obj_jugador.y) <250)
		{
			sprite_index= spr_troll_ataque;
			hspeed=0;

			
			
		}
		else
		{
			sprite_index= spr_troll_caminar;
			hspeed =derecha;
			direccion=0;
			detectar=0;
			
		}
	}
}


#endregion
