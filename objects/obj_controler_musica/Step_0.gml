//
audio_sound_gain(som_atual,vol)

if (fade_mus == true)
{
	vol -= 0.1
	if (vol <= 0) fade_mus = false;
}

//Aumentar musica
if (on_mus == true)
{
	vol += 0.1
	if (vol <= 0) on_mus = false;
}


//Verificar qual room estamos
/*(switch(room)
{
	case RoomLevel_1: on_mus = true;
		break;
}*/

vol = clamp(vol,0,1)