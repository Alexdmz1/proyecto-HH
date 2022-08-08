/// @description destruir enemigo
instance_destroy();
with(other){
	
	trollSalud -= 1;
	if (trollSalud <=0){
		
		instance_destroy();
		trollSalud = 100;
	}

}