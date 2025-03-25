// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_restar_player(){
	if (y > fall_limit) {
	    instance_destroy(); // Destruye al jugador
    
	    // Crear un nuevo jugador en la posición inicial
	    instance_create_layer(start_x, start_y, "Instances", object_index);
	}

}