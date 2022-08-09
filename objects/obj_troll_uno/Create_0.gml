/// @description Insert description here
// You can write your code in this editor
cambiarsprite=false;
#region// autodestruirse
//alarm[0] = 5*room_speed;
#endregion
detectar=false;
direccion = 0;
derecha = 2;
izquierda= -2;
//walkspd=4;
hspeed = derecha;

//event_inherited();
trollSalud = 100;



#region//ESTADOS DEL JUGADOR
enum ESTADO_ENEMIGO
{
	CAMINAR,
	ATACAR
}
#endregion

#region//ESTADO INTERNO DEL JUGADOR
estado = ESTADO_ENEMIGO.CAMINAR; // estado inicial
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