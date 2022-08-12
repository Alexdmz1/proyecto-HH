// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function danhio_al_troll(){
	trollSalud -= 1;
	if (trollSalud <=0){
		
		instance_destroy();
		trollSalud = 100;
	}
}