// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function src_player_jump_animation(){
	if(velocidad_y != 0 && !place_meeting(x, y+1, obj_platform))
	{	sprite_index = spr_player_jump;
		image_index = 4;
	}

}