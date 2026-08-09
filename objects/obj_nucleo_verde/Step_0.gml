//Mudar imagem index
//ativo 
ativo = global.abrir_level

if (ativo && !audio)
{
	audio_play_sound(shockEnd,100,false)
	audio = true
}

if (!ativo) audio = false;

//Mudar sprite
sprite_index = ativo ? spr_nucleo_on : spr_nucleo_off
