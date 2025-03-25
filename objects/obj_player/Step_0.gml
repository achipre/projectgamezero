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
y += velocidad_y

scr_restar_player()