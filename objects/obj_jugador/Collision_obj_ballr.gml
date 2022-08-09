/// @description


global.saludH-=1;
if(global.saludH<=0 &&lives>0){
	lives-=1;
	global.saludH=100;
	x=global.reaparecerX;
	y=global.reaparecerY;
}
if(lives<=0){
	global.saludH=0;
	instance_destroy();
}
