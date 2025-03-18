/// @description Insert description here
// You can write your code in this editor

// Evento Step
if(!is_vertical)
{
	if (x >= x_max) { // x mayor o igual a 224
		direction = 180; // ⬅ Cambia dirección a la izquierda
	}
	if (x <= x_min) { // x menor o igual 129
	    direction = 0; // ➡ Cambia dirección a la derecha
	}
}
if(is_vertical)
{
	if (y >= y_max) { // y mayor o igual 160
		direction = 90; // ⬇ Cambia dirección hacia abajo
	}
	if (y <= y_min) { // y menor o igual 48
		direction = 270; // ⬆ Cambia dirección hacia arriba
	}
}

