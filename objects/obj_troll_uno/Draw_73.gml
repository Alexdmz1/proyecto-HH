/// @description dibujar variables

#region DIBUJAR VARIABLES
var color=c_red;
draw_set_color(color);
draw_text(x,y,"salud:  "+string(trollSalud));

draw_text(x,y-20,"detectar:  "+string(detectar));

draw_text(x,y-40,"estado:  "+string(estado));

draw_text(x,y-60,"estado interno:  "+string(estadoInterno));

draw_text(x,y-80,"hspeed:  "+string(hspeed));

draw_text(x,y-100,"dirección:  "+string(direccion));

draw_text(x,y-120,"atacar:  "+string(atacar));
#endregion