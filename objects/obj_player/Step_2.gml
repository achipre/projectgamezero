/// @description Insert description here
// You can write your code in this editor

#region Platform Movil
var _platform_movil = collision_rectangle(x + 5, y, x - 5, y + 1, obj_platform, false, false)

if (_platform_movil && vspeed == 0)
{
	x += _platform_movil.hspeed;
	if(_platform_movil.vspeed > 0)
	{
		y += _platform_movil.vspeed;
	} else if (_platform_movil.vspeed < 0)
	{
		y = _platform_movil.y;
	}
}
#endregion