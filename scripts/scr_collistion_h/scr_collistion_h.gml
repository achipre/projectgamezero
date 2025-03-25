// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_collistion_h(){
	var _sub_pixel = .5
	if (place_meeting(x + velocidad_x, y, obj_block)) {
		var _pixel_check = _sub_pixel * sign(velocidad_x)
	    while (!place_meeting(x + _pixel_check, y, obj_block)) 
		{
	        x += _pixel_check;
	    }
	    velocidad_x = 0;
	}
}