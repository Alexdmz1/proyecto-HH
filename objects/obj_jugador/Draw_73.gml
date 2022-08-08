/// @description ESTADOS
// aqui tambiem se puede dibujar barra de vida
draw_text(obj_jugador.x,obj_jugador.y,"estado: "+ string(estado));

draw_text(obj_jugador.x,obj_jugador.y-20,"velocidad v: "+ string(velocidadVertical));

draw_text(obj_jugador.x,obj_jugador.y-40,"velocidad h: "+ string(velocidadHorizontal));
var movimientoHorizontal = -moverse_izquerda + moverse_derecha;

draw_text(obj_jugador.x,obj_jugador.y-60,"movimiento h: "+ string(movimientoHorizontal));

draw_text(obj_jugador.x,obj_jugador.y-80,"tiempo de disparo: "+ string(tiempoDeDisparo));






