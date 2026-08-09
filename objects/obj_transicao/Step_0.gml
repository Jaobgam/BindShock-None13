
//Se a room for igual a proxima room, significa que hora da abertura
if (room == global.proxima_room)
{	
	
	global.player_select = false
	
	if instance_exists(obj_controler)
	{
		obj_controler.mudar = true
		
	}
	
	global.proxima_room = noone;
	
	instance_destroy()
}

show_debug_message(room)
show_debug_message(global.proxima_room)
show_debug_message(a)
/*
if iniciou
{
	//Se não existir
	if (!layer_sequence_exists("transicao",_seq))
	{
		var _s = 
	}
	
	//Se ela terminou
	if (layer_sequence_is_finished(sq_transicao) != 0)
	{
		show_debug_message("terminou")
	}
	
	show_debug_message(layer_sequence_get_length(_seq))
}

/*
if alpha <= 1 && !fechou 
{
	alpha = lerp(alpha,1,.3)

	if alpha >= 1 {fechou = true}
}

if alpha >= 0 && fechou
{
	//Mudar a room
	if room != _room {room_goto(_room)
	
	//Abrir
	alpha = lerp(alpha,0,.3)
	
	if alpha <= 0 {instance_destroy()}
}