/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_set_font(fnt_control)
if(velocidad_y > 0)
{
	var _platform = place_meeting(x, y, obj_block_left)
	if(_platform)
	{
		draw_text(x, y - 20, "sas")
	}
}