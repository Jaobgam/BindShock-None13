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
	
	//Se começou a mover
	var _comecou_mover = (_parado && (_dx != 0 || _dy != 0));

	//Se o movimento for 0 então não há movimento
	_parado = (_dx == 0 && _dy == 0);
	
	//Vou decidir se no proximo bloco ele vai mover ou não
	if (_comecou_mover)
	{
		//Ele vai sentir a colisão do proxiimo bloco, sentido a colisão ele vai travar pra não andar
		if (_dx > 0) seguir_x = !place_meeting(x+32, y, obj_solido) && !travado_right;
		else if (_dx < 0) seguir_x = !place_meeting(x-32, y, obj_solido) && !travado_left;
		else seguir_x = true;
		
		//Mas ele vai continuar o caminho até parar, ai sim vai adnar
		if (_dy > 0) seguir_y = !place_meeting(x, y+32, obj_solido) && !travado_down;
		else if (_dy < 0) seguir_y = !place_meeting(x, y-32, obj_solido) && !travado_up;
		else seguir_y = true;
	}
	
	//Sou um bloco desligado, que ficou ligado porque outro bloco com o player, colidiu comigo
	if (colisao != "Nenhum")
	{
		if (seguir_x) x += _dx;
		if (seguir_y) y += _dy;
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

	//Reseta pro próximo ciclo de movimento
	seguir_x = true;
	seguir_y = true;
	
//
}

//Mudar de sprite
image_index = ligado ? 1 : 0;