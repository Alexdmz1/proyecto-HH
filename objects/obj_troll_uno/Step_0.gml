/// @description máquina de estados


#region //colisión y daño al troll

var inst= collision_rectangle(x-100, y-20, x+280,y+ 208, obj_shuriken, false, true);
 if(inst!=noone){
	cambiarsprite=true;
	danhio_al_troll();
	instance_destroy(obj_shuriken);
 }
 
 #endregion

#region// parámetros colisión
if not place_free(x+2,y){
	hspeed =velocidadIzquierda;
	direccion = 1;
	image_xscale=-1;
}
if not place_free(x-2,y){
	hspeed =velocidadDerecha;
	direccion = 0;
	image_xscale=1;
}
#endregion

#region// gravedad
if place_free(x,y+1){
	gravity =1;
}else{
	gravity= 0;
}
#endregion

#region// máquina de estados;


switch(estado){
	case ESTADO_ENEMIGO.CAMINAR:
	
		if (estadoInterno == 0) //entrar
		{
			estadoInterno = 1;
			sprite_index = spr_troll_caminar;
				
		
		}
		if (estadoInterno == 1) //actualizar
		{
			if(instance_number(obj_jugador)>0){
				// detectar jugador
				if place_meeting(x-250,y,obj_jugador) || place_meeting(x+250,y,obj_jugador)
				{
					detectar=true;
				}
				else
				{
					detectar=false;
	
	}

				//voltear a la izquierda si el jugador esta a espaldas
				if(detectar==true&&hspeed==velocidadDerecha&&obj_troll_uno.x>obj_jugador.x){
					
					hspeed =velocidadIzquierda;
					direccion=1;
					image_xscale=-1;
					// dibujar rectángulo y si tal colisiona con el jugador cambiar de estado
					var inst= collision_rectangle(obj_troll_uno.x-400, obj_troll_uno.y-200, obj_troll_uno.x+400,obj_troll_uno.y+ 408, obj_jugador, false, true);
					if(inst!=noone){
				 
						cambiarEstado(ESTADO_ENEMIGO.ATACAR);
						atacar=true;
				
					 }	
				}
				//voltear a la derecha si el jugador esta a espaldas
				if(detectar==true&&hspeed==velocidadIzquierda&&obj_troll_uno.x<obj_jugador.x){
				
					hspeed =velocidadDerecha;
					direccion=0;
					image_xscale=1;
					// dibujar rectángulo y si tal colisiona con el jugador cambiar de estado
					var inst=  collision_rectangle(obj_troll_uno.x-400, obj_troll_uno.y-200, obj_troll_uno.x+400,obj_troll_uno.y+ 408, obj_jugador, false, true);
					if(inst!=noone){
				 
						cambiarEstado(ESTADO_ENEMIGO.ATACAR);	
						atacar=true;
				
					 }				
				}
		}else{exit;}
		}
			
		if (estadoInterno == 2) //salir
		{
			estado = siguienteEstado;
			estadoInterno = 0;
		}			
		break;
	case ESTADO_ENEMIGO.ATACAR:
	
		if(estadoInterno==0) //entrar
		{
			estadoInterno=1;
			sprite_index=spr_troll_ataque;
			hspeed=0;
			atacar=true
			//detectar=false;
		}
		
		if(estadoInterno==1) //actualizar
		{
			if(instance_number(obj_jugador)>0){
				//voltear a la izquierda si el jugador esta a espaldas
				if(obj_troll_uno.x>obj_jugador.x&&atacar==true)
				{
					direccion=1;
					hspeed=0;
					image_xscale=-1;
					//crear un objeto que dañe al jugador
					if(instance_number(obj_golpe)<=0){instance_create_layer(obj_troll_uno.x-150,obj_troll_uno.y+50,"Instances",obj_golpe);}
				}
				//voltear a la derecha si el jugador esta a espaldas
				if(obj_troll_uno.x<obj_jugador.x&&atacar==true)
				{
					direccion=0;
					hspeed=0;
					image_xscale=1;
					//crear un objeto que dañe al jugador
					if(instance_number(obj_golpe)<=0){instance_create_layer(obj_troll_uno.x+150,obj_troll_uno.y+50,"Instances",obj_golpe);}
					

				}
			
				// dibujar rectángulo y si tal colisiona con el jugador cambiar de estado
				var inst= collision_rectangle(obj_troll_uno.x-400, obj_troll_uno.y-200, obj_troll_uno.x+400,obj_troll_uno.y+ 408, obj_jugador, false, true);
				if(inst=noone){
					atacar=false;
					cambiarEstado(ESTADO_ENEMIGO.CAMINAR);		
					instance_destroy(obj_golpe);
				
					}	
				
			}
			else
			{
				
				cambiarEstado(ESTADO_ENEMIGO.CAMINAR);
				atacar=false;
				exit;
			}

		}

		if (estadoInterno == 2) //salir
		{
			estado = siguienteEstado;
			estadoInterno = 0;
		}
		break;
}



#endregion

