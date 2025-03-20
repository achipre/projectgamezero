// Step Event (Evento Step)

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
if (place_meeting(x, y + 1, obj_block)) {
	en_suelo = true;
    coyote_time = coyote_time_max; // Reinicia el coyote time
} else {
    en_suelo = false;
    coyote_time = max(0, coyote_time - 1); // Reduce el tiempo de coyote

	show_debug_message(coyote_time)
}


// --- Salto ---
if (_key_jump && coyote_time > 0) {
    velocidad_y = jump_force;
	coyote_time = 0; // Evita que el jugador use Coyote Time dos veces seguidas
	sprite_index = spr_player_jump;
}

velocidad_y += grav;


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


// Si el jugador cae más allá del límite, destruir y reiniciar
if (y > fall_limit) {
    instance_destroy(); // Destruye al jugador
    
    // Crear un nuevo jugador en la posición inicial
    instance_create_layer(start_x, start_y, layer, object_index);
}