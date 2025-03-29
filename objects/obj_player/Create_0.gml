// Llama a la función que inicializa las entradas del jugador
scr_inputcreate()

// Variables de estado del jugador
has_cape = false          // Indica si el personaje tiene una capa
is_bird_stuck = false     // Indica si el personaje está atrapado por un pájaro
god_mode = false          // Activa/desactiva el modo invencible
is_neutral = false        // Indica si el personaje está en un estado neutral
jump_triggered = false    // Indica si se ha activado un salto


// Determina si el fondo debe ser negro verdadero en función de la existencia de ciertos objetos
/*if (instance_exists(oSpaceDay) || instance_exists(oFlowerDay))
    is_true_black = true
else
    is_true_black = false
*/
// Si existe el objeto de bandera neutral, activa el estado neutral
/*
if instance_exists(oNeutralFlag)
    is_neutral = true
*/
// Configuración del nivel y visibilidad
level_number = 0      // Número del nivel actual
is_night = false      // Indica si es de noche
/*if instance_exists(oRoomTransition)
    visible = false  // Oculta el objeto durante la transición de sala
else
    visible = true   // Lo mantiene visible si no hay transición*/

// Variables de movimiento y físicas del jugador
on_ladder = false      // Indica si el personaje está en una escalera
last_platform = 0      // Última plataforma tocada
win_wait_time = 60     // Tiempo de espera tras ganar el nivel
grace_time = 0         // Tiempo de gracia antes de perder control
grace_time_frames = 10 // Duración del tiempo de gracia en frames
horizontal_speed = 0   // Velocidad horizontal
vertical_speed = 0     // Velocidad vertical
jump_speed = 2.25      // Velocidad de salto
max_fall_speed = 1     // Velocidad máxima de caída
fall_acceleration = 0.25 // Aceleración de caída
air_friction = 0.25    // Fricción en el aire

// Variables de objetos y mecánicas del juego
object_pick_count = 0  // Contador para recoger objetos
general_counter = 0    // Contador auxiliar
is_invulnerable = true // Indica si el personaje es invulnerable
wall_cling_time = 4    // Tiempo que puede aferrarse a una pared
can_move = true        // Habilita el movimiento del personaje
is_sticking = true     // Indica si el personaje puede adherirse a superficies
can_stick_to_walls = false // Indica si el personaje puede activamente adherirse a las paredes
flash_effect = 0       // Contador para efectos visuales de parpadeo
has_jumped = false     // Indica si el personaje ha saltado
has_landed = false     // Indica si el personaje ha aterrizado en el suelo
target_platform = 0    // Plataforma objetivo
wall_target = 0        // Pared objetivo
is_on_ground = on_ground() // Comprueba si el personaje está en el suelo



// Variables de colisión
collision_x = 0  // Coordenada X auxiliar
collision_y = 0  // Coordenada Y auxiliar
is_left_wall = place_meeting((x - 1), y, obj_block)  // Verifica colisión a la izquierda
is_right_wall = place_meeting((x + 1), y, obj_block) // Verifica colisión a la derecha
is_sticking = false  // Inicializa la adherencia como falsa


// Definición de estados del personaje
STATE_IDLE = 10
STATE_RUNNING = 11
STATE_JUMPING = 12
STATE_WINNING = 13
player_state = STATE_IDLE // Estado inicial del personaje (inactivo)


// Variables del entorno y objetos
star_count = 0        // Contador de estrellas recolectadas
room_width_var = room_width  // Ancho de la sala
room_height_var = room_height // Alto de la sala

// Si no hay una estrella en la habitación, crea una y la oculta
/*if (!instance_exists(oStar))
{
    var new_star = instance_create_layer(room_width_var, room_height_var, layer, oStar)
    new_star.visible = false
}*/

// Contador de estrellas inicial
/*initial_star_count = instance_number(oStar)*/


// Variables de tiempo y efectos visuales
idle_time = 0     // Tiempo en estado inactivo
elapsed_time = 0  // Tiempo total transcurrido
has_glow_effect = false // Efecto de brillo desactivado
parent_object = self // Referencia a sí mismo


// Configuración de alarmas
/*alarm[11] = game_get_speed(gamespeed_fps) * 30 // Establece una alarma basada en la velocidad del juego*/
