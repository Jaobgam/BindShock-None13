//Verificar quantos ativadores tem na sala

//Verificar se esta colidindo com o player
var _inst = instance_place(x,y,obj_player_normal)

//Verificar se está dentro do player
if _inst
	&& _inst.energia
	&& todos_ativos()
{
	//show_debug_message(todos_ativos())
	//Abrir porta para o proximo level
	global.abrir_level = true
	//show_message("ativo")
	
	//Fazer player ter dois de energia
	//obj_player_normal.player_energia.energia_qnt = 2
}
else
{
	if !trava
	{
		global.abrir_level = false
	}
	//Fazer player ter dois
}

//show_debug_message("abrir: " +string(global.abrir_level))
//show_debug_message("player energia: " +string(obj_player_normal.energia))

if _inst {if !audio_is_playing(laizer) {audio_play_sound(laizer,3,false,.1)}} 

if _inst sprite_index = spr_base_ligado; else sprite_index = spr_base;