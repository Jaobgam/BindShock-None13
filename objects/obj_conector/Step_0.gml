//Colisão Esquerda
_col_left_solid		= collision_rectangle(x,y+5,x - 20,(y + sprite_height)-5,obj_solido,false,false)
_col_left_conect	= collision_rectangle(x,y+5,x - 20,(y + sprite_height)-5,obj_conector,false,false)

//Colisão Direita
_col_right_solid	= collision_rectangle(x + sprite_width,y+5,x + sprite_width + 20,(y + sprite_height)-5,obj_solido,false,false)
_col_right_conect	= collision_rectangle(x + sprite_width,y+5,x + sprite_width + 20,(y + sprite_height)-5,obj_conector,false,false)

//Colisão Cima
_col_up_solid		= collision_rectangle(x+5,y,(x + sprite_width)-5,y - 20,obj_solido,false,false)
_col_up_conect		= collision_rectangle(x+5,y,(x + sprite_width)-5,y - 20,obj_conector,false,false)

//Colisão Baixo
_col_down_solid		= collision_rectangle(x+5,y + sprite_height,(x + sprite_width)-5,y + sprite_height + 20,obj_solido,false,false)
_col_down_conect	= collision_rectangle(x+5,y + sprite_height,(x + sprite_width)-5,y + sprite_height + 20,obj_conector,false,false)



//Colisão COM O PLAYER
_col_left	= collision_rectangle(x,y+5,x - 20,(y + sprite_height)-5,obj_player_normal,false,false)
_col_right	= collision_rectangle(x + sprite_width,y+5,x + sprite_width + 20,(y + sprite_height)-5,obj_player_normal,false,false)
_col_up		= collision_rectangle(x+5,y,(x + sprite_width)-5,y - 20,obj_player_normal,false,false)
_col_down	= collision_rectangle(x+5,y + sprite_height,(x + sprite_width)-5,y + sprite_height + 20,obj_player_normal,false,false)

if _col_left || _col_right || _col_up || _col_down
{
	//Definir player se não tiver colisão
	_col_player	= collision_rectangle(x-20,y-10,x+sprite_width+20,y+sprite_height+10,obj_player_normal,false,false);
}


//Verificar com o player
if	_col_right && 
	_col_right.energia == true &&
	_col_right.in_move == false &&
	at_direita || //Pode ativar na direita
	_col_left &&
	_col_left.energia == true &&
	_col_left.in_move == false &&
	at_esquerda || //Pode ativar na esquerda
	_col_up &&
	_col_up.energia == true &&
	_col_up.in_move == false &&
	_col_up.in_move == false &&
	at_cima || //Pode ativar em cima
	_col_down &&
	_col_down.energia == true &&
	_col_down.in_move == false &&
	at_baixo//Pode ativar embaixo
{
	//show_debug_message("teste: " + string(id))
	ligado = true;
	desliga_time = 0;
	colisao = "Player";
	fonte_lado = "Player";
	
	ligado_spr = true;
} 
else 
{
	if _parado == true
	{
		ligado = false;
	}
}





//travado_left	=	(_col_left_solid	||	_col_left_conect)
//Verificar esquerda
//if (_col_left_conect != noone) {if (_col_left_conect.ligado == false) {_col_right_conect = 1} else {_col_right_conect = 0}}

	
//travado_right		=	(_col_right_solid		||	_col_right_conect)
//travado_left	=	(_col_left_solid	||	_col_left_conect.ligado == true)

//Esquerda
travado_left =
    (_col_left_solid != noone) ||
    (_col_left_conect != noone && (!_col_left_conect.ligado || _col_left_conect._col_left_solid != noone || _col_left_conect.travado_left == 1));
	
//Direita
travado_right =	
	(_col_right_solid != noone) ||
	(_col_right_conect != noone && (!_col_right_conect.ligado || _col_right_conect._col_right_solid != noone || _col_right_conect.travado_right == 1));

//Baixo
travado_down =	
	(_col_down_solid != noone) ||
	(_col_down_conect != noone && (!_col_down_conect.ligado || _col_down_conect._col_down_solid != noone || _col_down_conect.travado_down == 1));

//Cima
travado_up =	
	(_col_up_solid != noone) ||
	(_col_up_conect != noone && (!_col_up_conect.ligado || _col_up_conect._col_up_solid != noone || _col_up_conect.travado_up == 1));

//if _col_player == noone show_debug_message(_col_player)
//travado_up		=	(_col_up_solid		||	_col_up_conect)
//travado_down	=	(_col_down_solid	||	_col_down_conect)

//show_debug_message("travado left: " + string(travado_left))
//show_debug_message("travado right: " + string(travado_right))
//show_debug_message("travado up: " + string(travado_up))
//show_debug_message("travado down: " + string(travado_down))


//Beleza vamos lá, Agora se EU sou um bloco normal e eu colidir com um bloco ligado, e colidido com o player
/*show_debug_message(
	string(id) +
	" col_down: " + string(_col_down != noone) +
	" energia: " + string(_col_down != noone ? _col_down.energia : -1) +
	" in_move: " + string(_col_down != noone ? _col_down.in_move : -1) +
	" at_baixo: " + string(at_baixo) +
	" _parado: " + string(_parado) +
	" ligado: " + string(ligado)
)*/

//Tenho uma colisão na minha direita
//Direita
if (_col_right_conect != noone && 
	_col_right_conect.colisao != "Nenhum" && 
	at_direita && 
	_col_right_conect.at_esquerda && 
	_col_right_conect.fonte_lado != "Esquerda" &&
	(colisao == "Bloco" || _col_right_conect._parado))
{
	ligado = true;
	desliga_time = 0;
	colisao = "Bloco";
	fonte_lado = "Direita";
	ligado_spr = true;
	_col_player = _col_right_conect._col_player;
}
//Esquerda
else if (_col_left_conect != noone && 
	_col_left_conect.colisao != "Nenhum" &&
	at_esquerda &&
	_col_left_conect.at_direita &&
	_col_left_conect.fonte_lado != "Direita" &&
	(colisao == "Bloco" || _col_left_conect._parado))
{
	ligado = true;
	colisao = "Bloco";
	fonte_lado = "Esquerda";
	desliga_time = 0;
	ligado_spr = true;
	_col_player = _col_left_conect._col_player;
}
//Cima
else if (_col_up_conect != noone && 
	_col_up_conect.colisao != "Nenhum" &&
	at_cima &&
	_col_up_conect.at_baixo &&
	_col_up_conect.fonte_lado != "Baixo" &&
	(colisao == "Bloco" || _col_up_conect._parado))
{
	ligado = true;
	colisao = "Bloco";
	fonte_lado = "Cima";
	desliga_time = 0;
	ligado_spr = true;
	_col_player = _col_up_conect._col_player;
}
//Baixo
else if (_col_down_conect != noone && 
	_col_down_conect.colisao != "Nenhum" &&
	at_baixo &&
	_col_down_conect.at_cima &&
	_col_down_conect.fonte_lado != "Cima" &&
	(colisao == "Bloco" || _col_down_conect._parado))
{
	ligado = true;
	colisao = "Bloco";
	fonte_lado = "Baixo";
	desliga_time = 0;
	ligado_spr = true;
	_col_player = _col_down_conect._col_player;
}
/*

//Se eu tenho uma colisão na minha esquerda
if (_col_left_conect && _col_left_conect.energia_qnt >= 1 && _col_left_conect._parado == true)
{
	//O outro bloco vai ganhar energia também
	ligado = true
	//Adicionar meu id nesse bloco
	if adicionar == false {array_push(_col_left_conect.bloco,id); adicionar = true}
	//Colisão Bloco
	colisao = "Bloco"
}

//Vai travar na direita se, tiver colidindo com um bloco solido, se o bloco conecct estiver desligado e se o bloco conec




show_debug_message(string(id) + " colisao final: " + colisao + " fonte: " + fonte_lado)


/
#region Colisão com Bloco

	//Direita
	if (_gol_right && _gol_right.ligado)	&&
		_gol_right.energia_qnt >= 1			&&
		obj_player_normal.in_move == false	&&
		at_direita
	{
		show_debug_message("colidindo")
	
		colisao = "Bloco";
		ligado = true;
		travado_right = false;
	}
	else if _gol_right && (!_gol_right.ligado || _gol_right.energia_qnt <= 1)
	{
		travado_right = true;
	}


	//Esquerda
	if (_gol_left && _gol_left.ligado)	&&
		_gol_left.energia_qnt >= 1			&&
		obj_player_normal.in_move == false	&&
		at_esquerda
	{
		show_debug_message("colidindo")
	
		colisao = "Bloco";
		ligado = true;
		travado_left = false;
	}
	else if _gol_left && (!_gol_left.ligado || _gol_left.energia_qnt <= 1)
	{
		travado_left = true;
	}

#endregion
	/*/
	
//show_debug_message("Energia quantidade: " + string(energia_qnt))
//("Colisao com: " + string(colisao))

