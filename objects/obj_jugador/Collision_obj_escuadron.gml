///checar si es ,miembro de nuestra faction
/*if(other.escuadron == escuadron){ 
	exit;
}
else */
if(invisible){
	with(other){
		event_perform(ev_other,ev_user1);
		
	}
	exit;
	
}
//event_perform(ev_other,ev_user1);