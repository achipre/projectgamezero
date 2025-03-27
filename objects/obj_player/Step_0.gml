// Step Event (Evento Step)

#region Inputs del teclado
var _key_right = keyboard_check(vk_right);
var _key_left = keyboard_check(vk_left);
var _key_jump = keyboard_check_pressed(vk_space);
var _mov_horizontal = _key_right - _key_left;
#endregion

//Moviemiento Vertical
scr_mov_horizontal(_mov_horizontal)

// gravedad
scr_gravity()

//jump
scr_jump(_key_jump)

//Colision Horizontal
scr_collistion_h()
x += velocidad_x

scr_collistion_v()

var _platform = place_meeting(x , y + velocidad_y, obj_block_left);
var _sub_pixel = .5;
if (_platform && velocidad_y > 0) 
{
	var _pixel_check = _sub_pixel * sign(velocidad_y);
	
	while (!place_meeting(x, y + _pixel_check, obj_block_left)) {
	    y += _pixel_check;
	}
	velocidad_y = 0;
}

y += velocidad_y;

src_player_jump_animation()

scr_restar_player()
