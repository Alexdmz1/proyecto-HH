/// @description DIBUJAR EN SI MISMO

//XD
//aqui se pueden dibujar sprites
draw_self();


// Draw guns
if (arma != -1)draw_sprite_ext(spr_potenciador_jugador,arma,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
/// Draw invincible
if (invisible){
	var alpha = min(1,alarm[1]/60); //desvanecer el protector
	draw_sprite_ext(spr_potenciador_jugador, POTENCIADORES.INVISIBLE,x,y,
	image_xscale,image_yscale,image_angle,image_blend,
	alpha);
}