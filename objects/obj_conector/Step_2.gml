if (ligado)
{	

	//Se o player ta ligado e colidindo na esquerda, direita, cima ou baixo, e tem so 1 de energia
	//Então ele não passa energia nenhuma pros outros blocos
	//Se ele tiver mais de uma energia, ai ele passa pros outros blocos a quantidade de energia - 1
	//Assim os outros blocos vão poder grudar também	
	if obj_player_normal.player_energia.energia_qnt > 1
	{
		//Agora se for maior que 1, vai distribuir para os outros blocos
		energia_qnt = obj_player_normal.player_energia.energia_qnt - 1
	}
	
	//Alvo
	var _alvo = obj_player_normal;
	
	//if colisao == "Player" {_alvo = obj_player_normal; player_move = _alvo.in_move}
	//else if colisao == "Bloco" {_alvo = b_right.col player_move = _alvo.player_move}
	
	//Player movimento
	
		
	//Movimento do player
	var _dx = _alvo.x - _alvo.xprevious
	var _dy = _alvo.y - _alvo.yprevious
	
	//Se o movimento for 0 então não há movimento
	_parado = (_dx == 0 && _dy == 0);
	
	//Verificar se ele pode ir pra baixo
	//Ele esta indo pra baixo,
	var _pode_y = !place_meeting(x, y + _dy, obj_solido)
	var _pode_x = !place_meeting(x + _dx, y, obj_solido)
	
	var _pode_x2 = 1
	var _pode_y2 = 1
		
	if colisao == "Player"
	{
		if _parado
		{
			_pode_x2 = !place_meeting(x + _dx, y, obj_conector)
			_pode_y2 = !place_meeting(x, y + _dy, obj_conector)
		}
		
		if (_pode_x && _pode_x2) x += _dx
		if (_pode_y && _pode_y2) y += _dy
	}
	
	//Sou um bloco desligado, que ficou ligado porque outro bloco com o player, colidiu comigo
	if (colisao == "Bloco")
	{
		if (_pode_x) x += _dx
		if (_pode_y) y += _dy		
	}
	
	


}
else 
{
	//Mudar sprite	
	image_index = 0;
	
	//Resetar energia
	energia_qnt = 0;
	
	//Resetar adicionar
	adicionar = false;
	
	//Resetar bloco
	colisao = "Nenhum"
	
	//Resetar fonte lado
	fonte_lado = "Nenhum";
	
	//Resetar bloco
	bloco = [];
	
//
}

//Mudar de sprite
image_index = ligado ? 1 : 0;