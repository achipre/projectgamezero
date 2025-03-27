// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_collistion_v(){
	var _sub_pixel = .5
	if (place_meeting(x , y + velocidad_y, obj_block)) 
	{
		var _pixel_check = _sub_pixel * sign(velocidad_y);
	
	    while (!place_meeting(x, y + _pixel_check, obj_block)) {
	        y += _pixel_check;
	    }
	    velocidad_y = 0;
	}
	
	/*
	if (place_meeting(x , y + velocidad_y, obj_block_left) && velocidad_y > 0) 
	{
		var _pixel_check = _sub_pixel * sign(velocidad_y);
	
	    while (!place_meeting(x, y + _pixel_check, obj_block_left)) {
	        y += _pixel_check;
	    }
	    velocidad_y = 0;
	}
	if (place_meeting(x , y + velocidad_y, obj_block_right) && velocidad_y > 0) 
	{
		var _pixel_check = _sub_pixel * sign(velocidad_y);
	
	    while (!place_meeting(x, y + _pixel_check, obj_block_right)) {
	        y += _pixel_check;
	    }
	    velocidad_y = 0;
	}
	*/
}