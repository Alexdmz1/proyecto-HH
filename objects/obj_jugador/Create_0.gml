/// @description CONDICIONES INICIALES
//contadorDeSaltos=0;
lives=3;
event_inherited();
global.saludH=100;
//rapidezBala = 6; 
tiempoDeDisparo=0;
arma = -1;
invisible= false;
global.reaparecerX=x;
global.reaparecerY=y;
#region//VELOCIDAD, GRAVEDAD Y SALTO.
velocidadHorizontal=0;
velocidadVertical=0;
gravedad =0.3;
velocidadCaminar=7;
velocidadBrincar=-11;
#endregion

#region//ACTUALIZAR MOVIMIENTOS
actualizarMovimiento = function()
{
	velocidadVertical += gravedad;
	
	//collision horizontal
	//lugar_de_contacto  {se puede modificar las coordenadas}
	if (place_meeting(x + velocidadHorizontal ,y, obj_block))
	{
		while (!place_meeting(x + sign(velocidadHorizontal), y, obj_block))
		{
			x += sign(velocidadHorizontal);
		}
		velocidadHorizontal = 0;
	}
	x += velocidadHorizontal ;
	//collision vertical
	//se puede modificar las coordenadas
	if (place_meeting(x, y + velocidadVertical, obj_block))
	{
		while (!place_meeting(x, y + sign(velocidadVertical), obj_block))
		{
			y += sign(velocidadVertical);
		}
		velocidadVertical = 0;
	}
	y += velocidadVertical ;
}
#endregion

#region//ESTA EN TIERRA
estaEnTierra = function()
{
	return place_meeting(x, y+2, obj_block);
}
#endregion

#region//ESTADOS DEL JUGADOR
enum ESTADO_JUGADOR
{
	REPOSO,
	CORRER,
	BRINCAR,
	CALLENDO,
	AGACHARSE,
	DISPARAR
}
#endregion

#region//ESTADO INTERNO DEL JUGADOR
estado = ESTADO_JUGADOR.REPOSO; // estado inicial
estadoInterno = 0; //0-entrar, 1-actualizar, 2-salir
siguienteEstado = estado;
#endregion

#region//Cambiar estado
cambiarEstado = function(estadoSiguiente)
{
	siguienteEstado = estadoSiguiente;
	estadoInterno = 2;
}
#endregion