/// @description estado inicial


#region // CONDICIONES INICIALES
cambiarsprite=false;
detectar=false;
atacar=false;
velocidadDerecha = 2;
velocidadIzquierda= -2;
hspeed = velocidadDerecha;
direccion = 0; // derecha=0, izquierda=1;
trollSalud = 100;
#endregion

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

#region//CAMBIAR ESTADO
cambiarEstado = function(estadoSiguiente)
{
	estadoInterno = 2;
	siguienteEstado = estadoSiguiente;
	
}
#endregion