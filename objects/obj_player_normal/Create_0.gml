//Se ele ta ativo (Selecionado)
ativo = false;
energia = false; //O player vai descidir se vai ligar a energia ou desligar

//Se a energia estiver ligada, ele vai poder energizar os objeto pra cada lado,

audio = false

//Se pode mover
pode_mover = true	//Se pode mover ou nao
move_delay = 15;	//Frames ate poder se mover de volta

//Movimento vertical ou horizontal
move_spd = 64
hspd = 0;
vspd = 0;

//Em movimento
in_move = false

m_hspd = x;
m_vspd = y;

//Colisão com bloco
_col_left	= 0;
_col_right	= 0;
_col_up		= 0;
_col_down	= 0;


//Todos os robos conectados
robo_conectado = false	//Se o robo está conectado a outro robo
robos_em_ligacao = []	//Todos os robos que estão conectados ao principal

//O player vai ter energia pra cada lado
player_energia = 
{
	//Quantidade de energia
	energia_qnt : 2,
	
	
	//Energia que o player vai ter pra cada lado
	_left : 
	{
		//energia : 1,
		conectado : [],
		ultimo_valor : noone
	},
	
	_right :
	{
		//energia : 1,
		conectado : [],
		ultimo_valor : noone
	},
	
	_up :
	{
		//energia : 1,
		conectado : [],
		ultimo_valor : noone
	},
	
	_down : 
	{
		//energia : 1,
		conectado : [],
		ultimo_valor : noone
	},
}




//Função para verificar se dentro da array existe o valor
function array_contem_valor(_array, _valor_procurado) {
    // Descobre o tamanho total da array
    var _tamanho = array_length(_array);
    
    // Passa por cada posição, uma por uma
    for (var _i = 0; _i < _tamanho; _i++) {
        // Se encontrar o valor, avisa que sim (true) e para de procurar
        if (_array[_i] == _valor_procurado) {
            return true;
        }
    }
    
    // Se olhou a array inteira e não achou nada, avisa que não (false)
    return false;
}

//Função pra tirar array
function array_limpar(_array, _valor) {
	//Tamanho
	var _tamanho = array_length(_array);
	
	//Verificar se o valor não é nulo
	if _array != noone
	{
		//Verificar valor na array existe
		if array_contem_valor(_array,_valor)
		{
		    for (var _i = _tamanho - 1; _i >= 0; _i--) {
		        if (_array[_i] == _valor) {
		            array_delete(_array, _i, 1);
		        }
		    }
		}
	}
	else return //show_debug_message("nao tem valor")
	//else //show_message("nao tem valor")
}

//Pode mover bloco e nao so player
function pode_mover_bloco(_dx, _dy, _travado_var)
{
	var _pode = true;
	
	//Checagem do player
	if (place_meeting(x + _dx, y + _dy, obj_solido)) || (place_meeting(x + _dx, y + _dy, obj_laser)) return false;
	
	var _col = instance_place(x + _dx, y + _dy, obj_conector);
	if (_col != noone && (_col.ligado == false || variable_instance_get(_col, _travado_var)))
	{
		return false;
	}
	
	//Checagem de todos os blocos conectados na cadeia
	with (obj_conector)
	{
		if (colisao != "Nenhum")
		{
			if (place_meeting(x + _dx, y + _dy, obj_solido))
			{
				other._pode = false;
			}
			
			var _col2 = instance_place(x + _dx, y + _dy, obj_conector);
			if (_col2 != noone && _col2 != id && (_col2.ligado == false || variable_instance_get(_col2, _travado_var)))
			{
				other._pode = false;
			}
		}
	}
	
	return _pode;
}

//Função para verificar se ouve colisão

