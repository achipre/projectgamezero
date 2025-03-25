// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_mov_horizontal(_mov_horizontal){
	velocidad_x = _mov_horizontal * spd;
	if (_mov_horizontal != 0)
	{
		image_xscale = _mov_horizontal;
		sprite_index = spr_player_walk;
	} else 
	{
		sprite_index = spr_player_idle;
	}
	
	
}
