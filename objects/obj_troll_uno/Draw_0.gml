/// @description Insert description here
// You can write your code in this editor

draw_self();
if(sprite_index==spr_troll_caminar){
	if (cambiarsprite==true){	
		
			
		draw_sprite_ext(spr_troll_caminar_d,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		cambiarsprite=false;
		
	}
}


if(sprite_index==spr_troll_ataque){
	if (cambiarsprite==true){
		
		draw_sprite_ext(spr_troll_ataque_d,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		cambiarsprite=false;
		
	}
}