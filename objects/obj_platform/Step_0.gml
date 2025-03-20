/// @description Insert description here
// You can write your code in this editor

var _jugador = instance_place(x, y - 1, obj_player);

// Evento Step
if(!is_vertical)
{
	
	if (x >= x_max) { // x mayor o igual a 224
		direction = 180; // ⬅ Cambia dirección a la izquierda
		dir = -1;
	}
	if (x <= x_min) { // x menor o igual 129
	    direction = 0; // ➡ Cambia dirección a la derecha
		dir = 1;
		
	}
	// Permitir que el jugador se mueva con la plataforma
	if (_jugador != noone) {
		_jugador.x += speed * dir;
	}
}

if(is_vertical)
{
	
	if (y >= y_max) { // y mayor o igual 160
		direction = 90; // ⬇ Cambia dirección hacia abajo
		dir = 1;
	}
	if (y <= y_min) { // y menor o igual 48
		direction = 270; // ⬆ Cambia dirección hacia arriba
		dir = -1;
	}
}
