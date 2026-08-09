global.abrir_level = false
//global.level_atual = "tutorial"
layer_sequence_create("transicao",display_get_gui_width()/2,display_get_gui_height()/2,sq_transicao_in)


audio_stop_sound(hard_to_concluse)
if (!audio_is_playing(obj_controler_musica.musicas[2]))
{
	audio_play_sound(obj_controler_musica.musicas[2],1,true)
}