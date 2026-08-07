function transicao(_room){
	
	if !instance_exists(obj_transicao)
	{
		var inst = instance_create_layer(0,0,"controler",obj_transicao)
		global.proxima_room = _room
	}
}

function transicao_seq(){
	room_goto(global.proxima_room)
}

//Verificar se todos os ativadores da sala estão ativos
function todos_ativos() {
	
	var _tam = array_length(global.ativadores)
	
	//Verificar dentro da variavel
	for (var _i = 0; _i < _tam; _i++)
	{
		var _inst = global.ativadores[_i]
		
        if (!instance_exists(_inst))
        {
            return false;
        }
		
		if !_inst.ativo
		{
			return false;	
		}
	}
	
	return true;
	
}