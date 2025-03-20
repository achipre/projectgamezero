// Crear evento (Create Event)
// Variables de movimiento
// Guardar la posición inicial
depth = -1000;
start_x = x;
start_y = y;
velocidad_x = 0;      // Velocidad horizontal
velocidad_y = 0;      // Velocidad vertical
spd = 1.5;       // Velocidad de movimiento
grav = 0.5;    // Gravedad
jump_force = -5; // Fuerza de salto
en_suelo = false; // Variable para verificar si está en contacto con el suelo

// Tiempo extra permitido para saltar después de salir de una plataforma
coyote_time_max = 8; // Frames que dura el Coyote Time (ajusta según necesites)
coyote_time = 0; // Contador de Coyote Time


// Límite de caída antes de ser destruido
fall_limit = room_height + 100; // Ajusta según necesites
