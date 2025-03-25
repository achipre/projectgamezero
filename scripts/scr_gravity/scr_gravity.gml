// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gravity(){
	if (place_meeting(x, y + 1, obj_block)) {
		en_suelo = true;
	    coyote_time = coyote_time_max; // Reinicia el coyote time
	} else {
	    en_suelo = false;
	    coyote_time = max(0, coyote_time - 1); // Reduce el tiempo de coyote
	}
}