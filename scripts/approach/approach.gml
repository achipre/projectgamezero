
function approach(argument0, argument1, argument2)
{
    // Si la diferencia absoluta entre argument0 y argument1 es menor o igual a argument2
    if (abs(argument0 - argument1) <= argument2)
    {
        return argument1;  // Devuelve argument1 si ya está cerca de argument0
    }
    
    // Si la diferencia es mayor a argument2, ajusta argument0 hacia argument1
    return argument0 + sign(argument1 - argument0) * argument2;
}
