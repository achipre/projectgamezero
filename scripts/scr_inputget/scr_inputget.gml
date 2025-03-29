
function scr_inputget() // Captura las entradas del jugador
{
    // Determina si se ha presionado alguna dirección en el eje vertical
    if ((!key_up_axis_pressed) && (!key_down_axis_pressed))
        key_axis_pressed = false
    if (key_up_axis_pressed || key_down_axis_pressed)
        key_axis_pressed = true

    // Verifica si el modo arcade está desactivado
    /*if (oCamera.arcade == false)
    {
        // Si se está ejecutando en una Nintendo Switch, usa una función específica para capturar la entrada
        /*if (os_type == os_switch)
        {
            input_switch_get()
            return;
        }
		*/

        // Captura el movimiento en el eje vertical del joystick izquierdo
        /*key_down_axis_pressed = gamepad_axis_value(0, gp_axislv) > 0.3
        key_up_axis_pressed = gamepad_axis_value(0, gp_axislv) < -0.3

        // Captura el movimiento a la derecha
        key_right = (
            keyboard_check(ord("D")) ||               // Tecla "D"
            keyboard_check(vk_right) ||               // Flecha derecha
            gamepad_button_check(0, gp_padr) ||       // Cruceta derecha en gamepad
            gamepad_axis_value(0, gp_axislh) > 0.3 || // Joystick izquierdo inclinado a la derecha
            obDirection.key_right                     // Variable de dirección externa
        )

        // Captura el movimiento a la izquierda
        key_left = (
            keyboard_check(ord("A")) ||
            keyboard_check(vk_left) ||
            gamepad_button_check(0, gp_padl) ||
            gamepad_axis_value(0, gp_axislh) < -0.3 ||
            obDirection.key_left
        )

        // Captura el movimiento hacia abajo
        key_down = (
            keyboard_check_pressed(ord("S")) ||
            keyboard_check_pressed(vk_down) ||
            gamepad_button_check_pressed(0, gp_padd) ||
            obDirection.key_down
        )

        // Captura el movimiento hacia arriba
        key_up = (
            keyboard_check_pressed(ord("W")) ||
            keyboard_check_pressed(vk_up) ||
            gamepad_button_check_pressed(0, gp_padu) ||
            obDirection.key_up
        )

        // Captura la acción de salto (presionado solo en el primer frame)
        key_jump_pressed = (
            keyboard_check_pressed(vk_space) ||       // Barra espaciadora
            keyboard_check_pressed(ord("X")) ||
            keyboard_check_pressed(ord("Z")) ||
            gamepad_button_check_pressed(0, gp_face1) || // Botón A en gamepad
            gamepad_button_check_pressed(0, gp_face2) || // Botón B en gamepad
            gamepad_button_check_pressed(0, gp_face3) || // Botón X en gamepad
            obJump.key_jump
        )

        // Captura la acción de salto (mantenido)
        key_jump = (
            keyboard_check(vk_space) ||
            keyboard_check(ord("X")) ||
            keyboard_check(ord("Z")) ||
            gamepad_button_check(0, gp_face1) ||
            gamepad_button_check(0, gp_face2) ||
            gamepad_button_check(0, gp_face3) ||
            obJump.key_jump
        )

        // Captura la acción de inicio/pausa
        key_start = (
            keyboard_check_pressed(vk_return) ||  // Tecla Enter
            gamepad_button_check_pressed(0, gp_start) || // Botón Start en gamepad
            oBpause.key_start
        )
    }
    else // Modo arcade activado
    {*/
        // Controles simplificados (solo teclado)
        key_right = keyboard_check(vk_right)
        key_left = keyboard_check(vk_left)
        key_down = keyboard_check(vk_down)
        key_up = keyboard_check(vk_up)

        // Captura el salto en modo arcade
        key_jump_pressed = (
            keyboard_check_pressed(ord("B")) ||
            keyboard_check_pressed(ord("E")) ||
            keyboard_check_pressed(ord("H"))
        )

        key_jump = (
            keyboard_check(ord("B")) ||
            keyboard_check(ord("E")) ||
            keyboard_check(ord("H"))
        )

        // Captura la acción de inicio en modo arcade
        key_start = (
            keyboard_check_pressed(ord("M")) //||
            //oBpause.key_start
        )
    //}
}
