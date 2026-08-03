//Se ele ta ativo (Selecionado)
ativo = false;
energia = false; //O player vai descidir se vai ligar a energia ou desligar

//Se a energia estiver ligada, ele vai poder energizar os objeto pra cada lado,

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

//Todos os robos conectados
robo_conectado = false	//Se o robo está conectado a outro robo
robos_em_ligacao = []	//Todos os robos que estão conectados ao principal

//O player vai ter energia pra cada lado
player_energia = 
{
	//Energia que o player vai ter pra cada lado
	_left : 
	{
		energia : 1,
		conectado : [],
		ultimo_valor : noone
	},
	
	_right :
	{
		energia : 1,
		conectado : [],
		ultimo_valor : noone
	},
	
	_up :
	{
		energia : 1,
		conectado : [],
		ultimo_valor : noone
	},
	
	_down : 
	{
		energia : 1,
		conectado : [],
		ultimo_valor : noone
	}
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

//Função para verificar se ouve colisão

