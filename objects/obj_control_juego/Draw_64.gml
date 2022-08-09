/// @description 
switch(room){
	case rm_game:
	case rm_game_uno:
		
		//draw_sprite_ext(spr_troll_caminar_d,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		draw_sprite_ext(spr_healthbar,0,x+32,y+32,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
		draw_healthbar(x+62,y+32,x+230,y+50,global.saludH,c_black,c_red,c_green,0,true,true);
		var color=c_lime;
		draw_set_color(color);
		draw_text(x+32,y+55,"Lives: "+ string(lives));

		break;
}

