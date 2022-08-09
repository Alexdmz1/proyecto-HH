/// @description movimientos

// definir direccion

//if(!instance_exists(obj_jugador)) exit;


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


if place_meeting(x-270,y,obj_jugador) || place_meeting(x+270,y,obj_jugador)
{
	detectar=true;
}
else
{
	detectar=false;
	
}

if(detectar==true)
{
	switch(estado){
		case ESTADO_ENEMIGO.CAMINAR:
	
			if (estadoInterno == 0) //entrar
			{
				estadoInterno = 1;
				sprite_index = spr_troll_caminar;
				
		
			}
			if (estadoInterno == 1) //actualizar
			{
				if(x>obj_jugador.x){
					
					hspeed =izquierda;
					direccion=1;
					//detectar=false;
					
				}
				if(x<obj_jugador.x){
				
					hspeed =derecha;
					direccion=0;
					//detectar=false;
					
				}
				if(point_distance(obj_troll_uno.x,obj_troll_uno.y,obj_jugador.x,obj_jugador.y) <=270)
				{
	
					cambiarEstado(ESTADO_ENEMIGO.ATACAR);
					
				}
			}
			
			if (estadoInterno == 2) //exit
			{
				estado = siguienteEstado;
				estadoInterno = 0;
			}			
			break;
		case ESTADO_ENEMIGO.ATACAR:
	
			if(estadoInterno==0)
			{
				estadoInterno=1;
				sprite_index=spr_troll_ataque;
				hspeed=0;
				//detectar=false;
			}
		
			if(estadoInterno==1){
				
				if(x>obj_jugador.x)
				{
				
					image_xscale=-1;
					instance_create_layer(x-200,y-50,"Instances",obj_golpe);
				}
				if(x<obj_jugador.x)
				{
					image_xscale=1;
					instance_create_layer(x+200,y-50,"Instances",obj_golpe);
					

				}
				
				if(point_distance(obj_troll_uno.x,obj_troll_uno.y,obj_jugador.x,obj_jugador.y) >270)
				{
					//detectar=false;
					cambiarEstado(ESTADO_ENEMIGO.CAMINAR);
					instance_destroy(obj_golpe);
			
				}
	

			}

			if (estadoInterno == 2) //exit
			{
				estado = siguienteEstado;
				estadoInterno = 0;
			}
			break;
	}
}


#endregion

