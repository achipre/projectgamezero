// Step Event (Evento Step)

// Verificar si está en contacto con el suelo
en_suelo = place_meeting(x, y + 1, obj_block);

// --- Controles de movimiento horizontal ---
var _right = keyboard_check(vk_right);
var _left = keyboard_check(vk_left);
var _mov_horizontal = _right - _left;
velx = _mov_horizontal * spd;

if(_left)
{
	image_xscale = -1
}


// --- Gravedad ---
if (!en_suelo) {
    vely += grav;
} else {
    vely = 0;
	sprite_index = spr_player_idle;
}

// --- Salto ---
if (keyboard_check_pressed(vk_space) && en_suelo) {
    vely = -jump_force;
	sprite_index = spr_player_jump
}

// --- Colisión horizontal ---
if (place_meeting(x + velx, y, obj_block)) {
    while (!place_meeting(x + sign(velx), y, obj_block)) {
        x += sign(velx);
    }
    velx = 0;
}

// --- Aplicar el movimiento horizontal ---
x += velx;

// --- Colisión vertical ---
if (place_meeting(x, y + vely, obj_block)) {
    while (!place_meeting(x, y + sign(vely), obj_block)) {
        y += sign(vely);
    }
    vely = 0;
}

// --- Aplicar el movimiento vertical ---
y += vely;

// Agregar este código al evento Step de obj_player después del código de movimiento

// Verificar si el jugador está fuera de la vista de la cámara
var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

// Si el jugador está completamente fuera de los límites de la cámara
if (x + 24 < cam_x - sprite_width || x + 24 > cam_x + cam_w + sprite_width || 
    y < cam_y - sprite_height || y > cam_y + cam_h + sprite_height) {
    // Destruir el jugador
    instance_destroy();
}