// Script assets have changed for v2.3.0 see
function scr_inputcreate() // Inicializa las variables de entrada
{
    // Configura la zona muerta del joystick del gamepad (evita pequeñas desviaciones no deseadas)
    gamepad_set_axis_deadzone(0, 0.3) 

    // Inicializa las variables de entrada del jugador
    key_right = 0                // Movimiento hacia la derecha
    key_left = 0                 // Movimiento hacia la izquierda
    key_down = 0                 // Movimiento hacia abajo
    key_up = 0                   // Movimiento hacia arriba
    key_jump_pressed = 0         // Salto presionado (solo en el primer frame de la pulsación)
    key_jump = 0                 // Salto mantenido
    key_start = 0                // Botón de inicio/pause
    key_down_axis_pressed = 0    // Presionado en la dirección negativa del eje vertical
    key_up_axis_pressed = 0      // Presionado en la dirección positiva del eje vertical
    key_axis_pressed = 0         // Variable para detectar cualquier eje presionado
}
