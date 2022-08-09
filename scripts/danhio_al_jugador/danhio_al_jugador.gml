// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function danhio_al_jugador(){
	global.saludH-=1;
	if(global.saludH<=0 &&lives>0){
		lives-=1;
		global.saludH=100;
		//x=global.reaparecerX;
		//y=global.reaparecerY;
		timeline_speed = 4.2;
		timeline_position = 0;
		timeline_running = true;
		timeline_index = Timeline_reaparecer;
		timeline_loop = false;
		
		
	}
	if(lives<=0){
		global.saludH=0;
		instance_destroy();
	}
}