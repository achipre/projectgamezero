// Step Event (Evento Step)

// Verificar si está en contacto con el suelo
en_suelo = place_meeting(x, y + 1, obj_block);

// --- Controles de movimiento horizontal ---
var _key_right = keyboard_check(vk_right);
var _key_left = keyboard_check(vk_left);
var _key_jump = keyboard_check_pressed(vk_space);


var _mov_horizontal = _key_right - _key_left;

velocidad_x = _mov_horizontal * spd;

if (_mov_horizontal != 0)
{
	image_xscale = _mov_horizontal;
	sprite_index = spr_player_walk;
}
else
{
	sprite_index = spr_player_idle;
}
// --- Gravedad ---
if (!en_suelo) {
    velocidad_y += grav;
	show_debug_message("En Aire");
} else {
    velocidad_y = 0;
	show_debug_message("En Suelo");
}

// --- Salto ---
if (_key_jump && en_suelo) {
    velocidad_y += jump_force;
	sprite_index = spr_player_jump;
}

// --- Colisión horizontal ---
var _sub_pixel = .5
if (place_meeting(x + velocidad_x, y, obj_block)) {
	var _pixel_check = _sub_pixel * sign(velocidad_x)
    while (!place_meeting(x + _pixel_check, y, obj_block)) {
		
        x += _pixel_check;
    }
    velocidad_x = 0;
}

// --- Aplicar el movimiento horizontal ---
x += velocidad_x;

// --- Colisión vertical ---

if (place_meeting(x , y + velocidad_y, obj_block)) {
	
	var _pixel_check = _sub_pixel * sign(velocidad_y);
	
    while (!place_meeting(x, y + _pixel_check, obj_block)) {
        y += _pixel_check;
    }
    velocidad_y = 0;
}

// --- Aplicar el movimiento vertical ---
y += velocidad_y;
