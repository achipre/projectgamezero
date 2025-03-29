// Verifica si el personaje acaba de aterrizar desde el aire
if (is_on_ground == false && on_ground() == true)
{
    // Si no existe el objeto de transición, sacudimos el gamepad
    if (!instance_exists(oTransition))
        shake_gamepad(1, 3)
    
    // Crea partículas de polvo al azar
    repeat random_range(3, 5)
    {
        var dust = instance_create_layer(x, (y + sprite_height / 2), "Instances_2", oBigDust)
        dust.hsp = (random_range(-0.5, 0.5)) + hsp / 5
    }
}

// Actualiza la variable de si el personaje está en el suelo
is_on_ground = on_ground()

// Lógica de control de teclas
if (key_left == true)
    key_right = false

// Lógica para controlar el estado de "pegado" al techo o pared
if (((!key_right) && (!key_left)) || on_ground_var)
{
    can_stick_to_walls = true
    is_sticking = false
}
else if (((key_right && key_left) || (key_left && key_right)) && can_stick && (!on_ground_var))
{
    alarm[0] = cling_time
    is_sticking = true
    can_stick_to_walls = false
}

// Ajuste del temporizador de salto
if (key_left || key_right || key_jump_pressed)
    alarm[11] = game_get_speed(gamespeed_fps) * 30

// Comprobaciones de room y pausa
if (room == Room100 || instance_exists(oPauseMenu))
    alarm[11] += 1

// Movimiento y control del personaje cuando se presionan las teclas izquierda o derecha
if (key_left && (!key_right) && (!is_sticking))
{
    can_move = -1
    player_state = STATE_RUNNING
    if (horizontal_speed > 0)
        horizontal_speed = approach(horizontal_speed, 0, air_friction)
    horizontal_speed = approach(horizontal_speed, (-max_fall_speed), fall_acceleration)
}
else if (key_right && (!key_left) && (!is_sticking))
{
    can_move = 1
    player_state = STATE_RUNNING
    if (horizontal_speed < 0)
        horizontal_speed = approach(horizontal_speed, 0, air_friction)
    horizontal_speed = approach(horizontal_speed, max_fall_speed, fall_acceleration)
}

// Detener el movimiento cuando no se presionan teclas de movimiento
if ((!key_right) && (!key_left))
{
    horizontal_speed = approach(horizontal_speed, 0, air_friction)
    player_state = STATE_IDLE
}

// Lógica de caída y gravedad
if (is_on_ground)
{
    grace_time = grace_time_frames
    last_platform = instance_place(x, (y + 8), oBrokenStone)
}
else
{
    // Ajusta la gravedad dependiendo de la velocidad vertical
    if (vertical_speed > -1 && vertical_speed < 1)
        grav = 0.09
    else
        grav = 0.125
    vertical_speed = approach(vertical_speed, (3 + key_down * 2), grav)
    grace_time = approach(grace_time, 0, 1)
}

// Lógica de salto
if (key_jump_pressed == true && (!(place_meeting(x, y, oLadder))) && (!key_down))
{
    if (vertical_speed > -1)
    {
        // Lógica para el salto cuando no es de noche
        if (night == false)
        {
            var otherspike = instance_place(x, (y + 8), oParentNight)
            if (otherspike != noone)
            {
                y += (otherspike.bbox_top - (y + 10))
                if (!(place_meeting(x, y, oNope)))
                {
                    if (state != WIN && godmode == false)
                        instance_destroy()
                }
            }
        }
        else
        {
            // Lógica para el salto cuando es de noche
            otherspike = instance_place(x, (y + 8), oParentDay)
            if (otherspike != noone)
            {
                y += (otherspike.bbox_top - (y + 10))
                if (!(place_meeting(x, y, oNope)))
                {
                    if (state != WIN && godmode == false)
                        instance_destroy()
                }
            }
        }
        var near_solid = instance_place(x, (y + 8), oSolid)
        if (place_meeting(x, (y + 8), oPlatGhost) && (!(place_meeting(x, y, oPlatGhost))))
            near_solid = instance_place(x, (y + 8), oPlatGhost)
        if (near_solid != noone)
        {
            if (!(place_meeting(x, (y + 8), oRamp)))
            {
                grace_time = 2
                y += (near_solid.bbox_top - (y + 10))
            }
        }
        var otherbroken = instance_place(x, (y + 8), oBrokenStone)
        if (otherbroken != noone)
            instance_destroy(otherbroken)
    }
    if (grace_time > 0)
    {
        if (last_plat != noone)
            instance_destroy(last_plat)
        grace_time = 0
        vertical_speed = (-jumpspeed)
        image_index = 0
        container_play("SfxJump")
        if (neutral == false)
            scr_change()
        shake_gamepad(0.4, 2)
        repeat random_range(3, 5)
        {
            dust = instance_create_layer(x, (y + sprite_height / 2), "Instances_2", oBigDust)
            dust.hsp = hsp / (random_range(5, 10))
            dust.vsp = vsp / (random_range(5, 10))
        }
    }
}

// Actualiza el estado a "Saltar" si no está en el suelo
if (!on_ground_var)
    player_state = STATE_JUMPING

// Ajusta la escala de la imagen en función del movimiento
image_xscale = can_move

// Comprobación de ganancia de estrella en el estado 'inistar' y cambio de estado a "WIN"
if (star == inistar)
{
    with (oPermaSpike)
    {
        solidvar = instance_create_layer(x, y, layer, oSolid)
        solidvar.x = x
        solidvar.image_xscale = image_xscale
        solidvar.image_yscale = image_yscale
        solidvar.visible = false
    }
    state = WIN
    winwait -= 1
    if (winwait < 0)
    {
        if (!instance_exists(oTransition))
        {
            if instance_exists(oBird)
            {
                var levelminusoom = string_replace(room_get_name(room), "Room", "r")
                var loadvalue = variable_struct_get(oSaveManager.struct_main, levelminusoom)
                if (loadvalue == 0)
                {
                    variable_struct_set(oSaveManager.struct_main, levelminusoom, 0.5)
                    oSaveManager.save = true
                }
            }
            else
            {
                levelminusoom = string_replace(room_get_name(room), "Room", "r")
                variable_struct_set(oSaveManager.struct_main, levelminusoom, 1)
                oSaveManager.save = true
            }
            container_play("SfxStgClear")
            if instance_exists(oTimeAttack)
                oTimeAttack.hearts += 2
            var trans = instance_create_layer(0, 0, layer, oTransition)
            var level_index = oCamera.levelnumb
            var level_next = level_index + 1
            trans.target_room = asset_get_index(string_insert(level_next, "Room", 5))
            if (((level_index + 1) % 5) == 0)
                trans.target_room = 27
            if (level_index > 40)
                trans.target_room = 27
            if (oCamera.arcade == true)
            {
            }
        }
    }
}
