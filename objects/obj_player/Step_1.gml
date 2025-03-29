// Obtiene la entrada del jugador y verifica si hay una pared a la izquierda o derecha
scr_inputget()

// Verifica si hay una pared a la izquierda (movimiento en x-1)
is_left_wall = place_meeting(x - 1, y, obj_block)
// Verifica si hay una pared a la derecha (movimiento en x+1)
is_right_wall = place_meeting(x + 1, y, obj_block)

// Si hay una pared a la izquierda, guarda la instancia de la pared
if (is_left_wall)
{
    wall_target = instance_place(x - 1, y, oSolid)
}

// Si hay una pared a la derecha, guarda la instancia de la pared
if (is_right_wall)
{
    wall_target = instance_place(x + 1, y, oSolid)
}

// Asegura que el jugador permanezca dentro de los límites de la sala (mapeo circular)
/*
if (room != Room100)
{
    // Si la posición y es mayor que el alto de la sala, mueve al jugador hacia arriba
    if (y > roomh)
        y -= roomh
    
    // Si la posición x es mayor que el ancho de la sala, mueve al jugador hacia la izquierda
    if (x > roomw)
        x -= roomw
    
    // Si la posición y es menor que 0 (fuera por arriba), mueve al jugador hacia abajo
    if (y < 0)
        y += roomh
    
    // Si la posición x es menor que 0 (fuera por la izquierda), mueve al jugador hacia la derecha
    if (x < 0)
        x += roomw
}*/
// Reduce progresivamente el valor de 'numb' hacia 0
general_counter = approach(general_counter, 0, 1)

// Si el estado es WIN, o si existen instancias del menú de pausa, transición, o 'numb' es mayor que 0,
// desactiva las entradas del jugador
/*
if (player_state == WIN || instance_exists(oPauseMenu) || instance_exists(oTransition) || general_counter > 0)
{
    key_right = 0
    key_left = 0
    key_jump_pressed = 0
    key_jump = 0
    key_start = 0
}*/

// Si el modo de depuración está activado para la cámara, permite mover al jugador con teclas específicas
/*if (oCamera.debug == true)
{
    grav = 0 // Desactiva la gravedad durante la depuración

    // Si la tecla "I" es presionada, el jugador se mueve hacia arriba
    if (keyboard_check(ord("I")))
        vertical_speed = -2

    // Si la tecla "K" es presionada, el jugador se mueve hacia abajo
    if (keyboard_check(ord("K")))
        vertical_speed = 2

    // Si la tecla "J" es presionada, el jugador se mueve a la izquierda
    if (keyboard_check(ord("J")))
        horizontal_speed = -3

    // Si la tecla "L" es presionada, el jugador se mueve a la derecha
    if (keyboard_check(ord("L")))
        horizontal_speed = 3
}*/

// Si se presionan ambas teclas de dirección (derecha e izquierda), se desactiva el movimiento
if ((key_right + key_left) == 2)
{
    key_right = 0
    key_left = 0
}
