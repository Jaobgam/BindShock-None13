//Colisão na direita COM O PLAYER
var _col_left	= collision_rectangle(x,y+5,x - 20,(y + sprite_height)-5,obj_player_normal,false,false)
var _col_right	= collision_rectangle(x + sprite_width,y+5,x + sprite_height + 20,(y + sprite_height)-5,obj_player_normal,false,false)
var _col_up		= collision_rectangle(x+5,y,(x + sprite_width)-5,y - 20,obj_player_normal,false,false)
var _col_down	= collision_rectangle(x+5,y + sprite_height,(x + sprite_width)-5,y + sprite_height + 20,obj_player_normal,false,false)
	
//Verificar colisão direita
if	_col_right && 
	_col_right.energia == true &&
	_col_right.in_move == false ||
	_col_left &&
	_col_left.energia == true &&
	_col_left.in_move == false ||
	_col_up &&
	_col_up.energia == true &&
	_col_up.in_move == false ||
	_col_down &&
	_col_down.energia == true &&
	_col_down.in_move == false
{
	ligado = true;
	desliga_time = 0;
} 
else 
{
	//Se ele estiver parado
	if _parado == true
	{
		ligado = false;	
	}
	/*
		BLOCO COLIDIU COM O PLAYER, SE MOVIMENTOU JUNTO COM O PLAYER, DURANTE O MOVIMENTO, ELE VEM PRA CA PORQUE PRA ELE A MOVIMENTAÇÃO PAROU
		ENTÃO SE EM 20 FRAMES ELE NÃO TERMINOU A MOVIMENTAÇÃO
	
	/*
	//Se ele está se movendo
	//Ele vai desligar rapido se por acaso estiver ccolidindo
	//Se ele estiver ligado
	if (ligado)
	{
		//Ele so vai desligar se depois de alguns segundos o tempo acabar
		desliga_time++
	
		//Se o tempo acccacbar (largou de vez)
		if desliga_time >= desliga_time_max {
			//Se o player não esta se movendo[
			if player_move == false
			{
				//Desligar de vez
				ligado = false;
				desliga_time = 0;
			}
		}
	}*/
}

//Colisão com bloco solido
//Retornar verdadeiro ou falso
//Se noone == noone enntão retorna falso
//Se 32988 != noone então retorna verdadeiro
var _col_left_solid		= (collision_rectangle(x,y+5,x - 20,(y + sprite_height)-5, obj_solido,false,false) != noone) ||	(collision_rectangle(x,y+5,x - 20,(y + sprite_height)-5, obj_conector,false,false) != noone)
var _col_right_solid	= (collision_rectangle(x + sprite_width,y+5,x + sprite_width + 20,(y + sprite_height)-5,	obj_solido,false,false) != noone)	||	(collision_rectangle(x + sprite_width,y+5,x + sprite_width + 20,(y + sprite_height)-5,	obj_conector,false,false) != noone)
var _col_up_solid		= (collision_rectangle(x+5,y,(x + sprite_width)-5,y - 20,									obj_solido,false,false) != noone)	||	(collision_rectangle(x+5,y,(x + sprite_width)-5,y - 20,									obj_conector,false,false) != noone)
var _col_down_solid		= (collision_rectangle(x+5,y + sprite_height,(x + sprite_width)-5,y + sprite_height + 20,	obj_solido,false,false) != noone)	||	(collision_rectangle(x+5,y + sprite_height,(x + sprite_width)-5,y + sprite_height + 20,	obj_conector,false,false) != noone)

travado_left = _col_left_solid
travado_right = _col_right_solid
travado_up = _col_up_solid
travado_down = _col_down_solid
	
//	show_debug_message(player_move)

