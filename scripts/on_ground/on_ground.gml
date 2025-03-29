
function on_ground() {
    // Si el personaje se está moviendo hacia arriba, no está en el suelo
    if (vertical_speed < 0) {
        return false;
    }

    // Verifica si hay colisión con el suelo en la posición justo debajo del personaje
    return place_meeting(x, y + 1, obj_block) || place_meeting(x, y + 1, obj_block_left);
}
