// Variables auxiliares para movimiento
var _temp_horizontal_speed, _temp_vertical_speed;
collision_x += horizontal_speed;
collision_y += vertical_speed;

// Redondear velocidades para movimiento de píxeles enteros
hsp_new = round(collision_x);
vsp_new = round(collision_y);
cx -= hsp_new;
cy -= vsp_new;

has_jumped = false     // Indica si el personaje ha saltado
has_landed = false   

// Control de movimiento vertical
_temp_vertical_speed = abs(vsp_new);
if (_temp_vertical_speed > 0) {
    while (true) {
        if (!platform_check()) {
            y += sign(vertical_speed);
            _temp_vertical_speed -= 1;
            if (_temp_vertical_speed > 0) 
                continue;
            break;
        } else {
            vertical_speed = 0;
            break;
        }
    }
}

// Control de movimiento horizontal
var tempH = 1;
_temp_horizontal_speed = abs(hsp_new);

if (_temp_horizontal_speed > 0) {
    while (true) {
        // Verifica colisiones laterales con sólidos
        if (place_meeting(x + sign(horizontal_speed), y, obj_block) && 
            place_meeting(x + sign(horizontal_speed), y - 1, obj_block) && 
            !place_meeting(x + sign(horizontal_speed), y - 1, obj_block)) {
            y -= 1;
        } 
        else if (place_meeting(x + sign(horizontal_speed), y, obj_block) && 
                 !place_meeting(x + sign(horizontal_speed), y - 1, obj_block)) {
            y -= 1;
        }

        // Ajusta la posición al detectar colisiones mientras cae
        if (vertical_speed >= 0) {
            if (!place_meeting(x + sign(horizontal_speed), y, obj_block) && 
                !place_meeting(x + sign(horizontal_speed), y + 1, obj_block) && 
                place_meeting(x + sign(horizontal_speed), y + 2, obj_block)) {
                y += 1;
            } 
            else if (!place_meeting(x + sign(horizontal_speed), y, obj_block) && 
                     !place_meeting(x + sign(horizontal_speed), y + 1, obj_block) && 
                     place_meeting(x + sign(horizontal_speed), y + 1, obj_block)) {
                y += 1;
            }
        }

        // Movimiento a la derecha
        if (sign(horizontal_speed) == 1) {
            if (!place_meeting(x + 1, y, obj_block) &&
                !(place_meeting(x + 1, y, oPlatGhostL) && !place_meeting(x, y, oPlatGhostL))) {
                x += sign(horizontal_speed) * tempH;
            } else {
                horizontal_speed = 0;
            }
        }

        // Movimiento a la izquierda
        else if (sign(horizontal_speed) == -1) {
            if (!place_meeting(x - 1, y, obj_block)) {
                if (!place_meeting(x - 1, y, oPlatGhostR) || place_meeting(x, y, oPlatGhostR)) {
                    x += sign(horizontal_speed) * tempH;
                }
            } else {
                horizontal_speed = 0;
            }
        }

        // Actualizar velocidad horizontal restante
        _temp_horizontal_speed -= 1;
        if (_temp_horizontal_speed > 0) 
            continue;
        break;
    }
}
