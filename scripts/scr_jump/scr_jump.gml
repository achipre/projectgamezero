// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_jump(_key_jump){
	if (_key_jump && coyote_time > 0) 
	{
		velocidad_y = jump_force;
		coyote_time = 0; // Evita que el jugador use Coyote Time dos veces seguidas
		sprite_index = spr_player_jump;
		image_index = 4;
	}
	velocidad_y += grav
}