/// @description


#region // curva animación no utilizado
/*
curvaPosicion +=curvaRapidez;

curvaPosicion = curvaPosicion % 1;


var _trazoCurva =animcurve_get(curvaAsset);
var _canal = animcurve_get_channel(_trazoCurva,"x");
var _valor =animcurve_channel_evaluate(_canal,curvaPosicion);

x= xstart +_valor;



var _trazoCurva =animcurve_get(curvaAsset);
var _canal = animcurve_get_channel(_trazoCurva,"y");
var _valor =animcurve_channel_evaluate(_canal,curvaPosicion);

y= ystart +_valor;
*/
#endregion


sec += 0.03 // 30 =1  0,03 =1
if direccion = 1{

	image_xscale =1;

} 
else{
	image_xscale = 1;

}
  
// parametros collision
if not place_free(x+10,y){
	hspeed =izquierda;
	direccion = 0;
}
if not place_free(x-10,y){
	hspeed =derecha;
	direccion = 1;
}
if sec >= tiempo{
	
	sec=0;
	if(distance_to_object(obj_jugador)<300)crear_bala_enemigos(0,image_xscale*velocidadBalaBobos,tipoarma);
}
