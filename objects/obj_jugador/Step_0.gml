/// @description MOVIMIENTOS DEL JUGADOR


#region//ENTRADAS JUGADOR
/// Get players inputs

disparo = keyboard_check_pressed(ord("X"));
//acelerar = keyboard_check(ord("X"));
moverse_izquerda = keyboard_check(vk_left);
moverse_derecha= keyboard_check(vk_right);
brincar = keyboard_check_pressed(ord("C"));
agacharse = keyboard_check(vk_down);
brincar_pared=keyboard_check(ord("C"));
#endregion

#region//IMPLEMENTACIÓN MÁQUINA DE ESTADO
switch (estado)
{
	case ESTADO_JUGADOR.REPOSO:
	{
		//contadorDeSaltos=0;
		if (estadoInterno == 0) //entrar
		{
			estadoInterno = 1;
			sprite_index = spr_jugador_reposo;
			velocidadVertical = 0;
		}
		
		
		if (estadoInterno == 1) //actualizar
		{
			//var movimientoHorizontal = -moverse_izquerda + moverse_derecha;
			var movimientoHorizontal = -moverse_izquerda + moverse_derecha;
			velocidadHorizontal = movimientoHorizontal *velocidadCaminar*0;
			if (abs(movimientoHorizontal) > 0)
			{
				cambiarEstado(ESTADO_JUGADOR.CORRER);
			}
			else if(estaEnTierra() && disparo)
			{
				cambiarEstado(ESTADO_JUGADOR.DISPARAR);
				crear_arma(0,image_xscale*velocidadCaminar*2,escuadron,arma);
				//var inst =instance_create_layer(x,y,"Instances",obj_shuriken);
				//inst.speed *= image_xscale*velocidadCaminar;
			}	
			
			if (!estaEnTierra() )//&&velocidadVertical>0 agregando esta condicion se puede pegar a las paredes
			{
				
				cambiarEstado(ESTADO_JUGADOR.CALLENDO);
				
			}
			else if (brincar)
			{
					
				cambiarEstado(ESTADO_JUGADOR.BRINCAR);
			}


			else if(estaEnTierra() && agacharse)
			{
				cambiarEstado(ESTADO_JUGADOR.AGACHARSE);
			}

		}
		
		
		if (estadoInterno == 2) //exit
		{
			estado = siguienteEstado;
			estadoInterno = 0;
		}
	}
	break;
	
	
	case ESTADO_JUGADOR.CORRER:
	{
		if (estadoInterno == 0) //enter
		{
			estadoInterno = 1;
			sprite_index = spr_jugador_correr;
			
		}
		if (estadoInterno == 1) //update
		{
			var movimientoHorizontal = -moverse_izquerda + moverse_derecha;
			velocidadHorizontal = movimientoHorizontal *velocidadCaminar;
			if (movimientoHorizontal != 0)
			{
				
				image_xscale = sign(movimientoHorizontal);
			}
			else if (movimientoHorizontal == 0)
			{
				cambiarEstado(ESTADO_JUGADOR.REPOSO);
			}
				
			if (!estaEnTierra())
			{
				
				cambiarEstado(ESTADO_JUGADOR.CALLENDO);
			}
			else if (brincar){
				cambiarEstado(ESTADO_JUGADOR.BRINCAR);
			}
			if(disparo){
				cambiarEstado(ESTADO_JUGADOR.DISPARAR);
				crear_arma(0,image_xscale*velocidadCaminar*2,escuadron,arma);
				
			}

		}
		
		
		if (estadoInterno == 2) //exit
		{
			estado = siguienteEstado;
			estadoInterno = 0;
		}
	}
	break;
	
	
	case ESTADO_JUGADOR.BRINCAR:
	{
		if (estadoInterno == 0) //entrar
		{
			estadoInterno = 1; //cambiar el estado a 1
			sprite_index = spr_jugador_brincar;
			velocidadVertical = velocidadBrincar;
			//audio_play_sound(snd_Jump, 500, false);
		}
		if (estadoInterno == 1) //actualizar
		{
			
			
			//cambiar la direccion de la imagen
			var movimientoHorizontal = -moverse_izquerda + moverse_derecha;
			velocidadHorizontal = movimientoHorizontal * velocidadCaminar;
			if (movimientoHorizontal != 0)
			{
				image_xscale = sign(movimientoHorizontal);
			}
			
			//moverse derecha
			if(moverse_derecha){
				
				// derecha brincar entre paredes
				if(place_meeting(x-2,y,obj_block)&& !place_meeting(x,y+1,obj_block) &&!moverse_izquerda&&brincar_pared){
		
					velocidadVertical= velocidadBrincar;
				}
			}
			// moverse izquierda
			if(moverse_izquerda){
				
				// derecha brincar entre paredes
				if(place_meeting(x+2,y,obj_block)&& !place_meeting(x,y+1,obj_block)&&!moverse_derecha&&brincar_pared){
		
					velocidadVertical= velocidadBrincar;
		
				}
			}			
			/*
			doble salto
			if(velocidadVertical<0 && brincar)
			{
				contadorDeSaltos+=1;
				cambiarEstado(ESTADO_JUGADOR.BRINCAR);
				if(contadorDeSaltos>=2)
				{
					contadorDeSaltos=0;
					cambiarEstado(ESTADO_JUGADOR.CALLENDO);
				}
				
				
			}*/


				
			if (velocidadVertical >= 0)
			{
				cambiarEstado(ESTADO_JUGADOR.CALLENDO);
			}else if(disparo)
			{
				cambiarEstado(ESTADO_JUGADOR.DISPARAR);
			
				crear_arma(0,image_xscale*velocidadCaminar*2,escuadron,arma);
				//var inst =instance_create_layer(x,y,"Instances",obj_shuriken);
				//inst.speed *= image_xscale*velocidadCaminar;
			}

		}
		if (estadoInterno == 2) //salir
		{
			estado = siguienteEstado;
			estadoInterno = 0;
		}
	}
	break;
	
	
	case ESTADO_JUGADOR.CALLENDO:
	{
		if (estadoInterno == 0) //entrar
		{
			estadoInterno = 1;
			sprite_index = spr_jugador_cayendo;
			image_index = 0;
			
		}
		if (estadoInterno == 1) //actualizar
		{
			var movimientoHorizontal = -moverse_izquerda + moverse_derecha;
			velocidadHorizontal = movimientoHorizontal *velocidadCaminar*0;
			if (movimientoHorizontal != 0)
			{
				
				image_xscale = sign(movimientoHorizontal);
			}
			else if(!estaEnTierra() && disparo)
			{
				cambiarEstado(ESTADO_JUGADOR.DISPARAR);
				crear_arma(0,image_xscale*velocidadCaminar*2,escuadron,arma);
				//var inst =instance_create_layer(x,y,"Instances",obj_shuriken);
				//inst.speed *= image_xscale*velocidadCaminar;
			}	
			if (estaEnTierra())
			{
				cambiarEstado(ESTADO_JUGADOR.REPOSO);
			}

		}
		
		if (estadoInterno == 2) //salir
		{
			estado = siguienteEstado;
			estadoInterno = 0;
		}
	}
	break;
	
	
	case ESTADO_JUGADOR.AGACHARSE:
	{
		if(estadoInterno==0)
		{
			estadoInterno = 1;
			sprite_index = spr_jugador_abajo;
		
		}
		
		if(estadoInterno==1)
		{
			
			if (estaEnTierra() && !agacharse)
			{
				
				cambiarEstado(ESTADO_JUGADOR.REPOSO); // esta funcion tiene la variable estadoInterno=2;
			}

			
		}
		
		
		
		if (estadoInterno == 2) //salir
		{
			estado = siguienteEstado;
			estadoInterno = 0;
		}
	}
	break;
	
	case ESTADO_JUGADOR.DISPARAR:
	{
		if (estadoInterno == 0) //entrar
		{
			estadoInterno = 1;
			sprite_index = spr_jugador_disparo;
			
			
		}
		
		if(estadoInterno==1)
		{
			tiempoDeDisparo+=1;
			var movimientoHorizontal = -moverse_izquerda + moverse_derecha;
			velocidadHorizontal = movimientoHorizontal *velocidadCaminar*0;
			if (movimientoHorizontal != 0 &&(tiempoDeDisparo=20))
			{
				
				image_xscale = sign(movimientoHorizontal);
			}	

			if (estaEnTierra()&&(tiempoDeDisparo==20) && (!moverse_derecha || !moverse_izquerda))//  && hsp==0 quiza usarse
			{
				
				cambiarEstado(ESTADO_JUGADOR.REPOSO);
				tiempoDeDisparo=0;
				
			}
			else if(!estaEnTierra()&&tiempoDeDisparo==20){
				cambiarEstado(ESTADO_JUGADOR.CALLENDO);
				tiempoDeDisparo=0;
				}
			if (estaEnTierra()&&(tiempoDeDisparo==20) && (moverse_derecha || moverse_izquerda))//  && hsp==0 quiza usarse
			{
				
				cambiarEstado(ESTADO_JUGADOR.CORRER);
				tiempoDeDisparo=0;
				
			}
		}
		
		
		if (estadoInterno == 2) //salir
		{
			estado = siguienteEstado;
			estadoInterno = 0;
		}
	}
	break;
}

#endregion

actualizarMovimiento();

#region//ACELERAR
/*
if acelerar && velocidadCaminar==4{
	velocidadCaminar+=4;
}else{velocidadCaminar=4;}
*/
#endregion

switch(room)
{
	case rm_game_uno:
		move_wrap(true, false, sprite_width/2);
		break;
}

//move_wrap(true, false, sprite_width/2);
