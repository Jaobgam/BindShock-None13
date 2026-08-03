if (ligado)
{	
	//Player movimento
	player_move = obj_player_normal.in_move

	//Movimento do player
	var _dx = obj_player_normal.x - obj_player_normal.xprevious
	var _dy = obj_player_normal.y - obj_player_normal.yprevious
	
	//Se o movimento for 0 então não há movimento
	_parado = (_dx == 0 && _dy == 0);
	
	
	//Verificar se ele pode ir pra baixo
	//Ele esta indo pra baixo,
	var _pode_y = !place_meeting(x, y + _dy, obj_solido)
	var _pode_x = !place_meeting(x + _dx, y, obj_solido)
	
	var _pode_y2 = !place_meeting(x, y + _dy, obj_conector)
	var _pode_x2 = !place_meeting(x + _dx, y, obj_conector)
	
	if (_pode_x && _pode_x2) x += _dx
	if (_pode_y && _pode_y2) y += _dy
	
	//Mudar de sprite
	image_index = 1;

}
else 
{
	//Mudar sprite	
	image_index = 0; 
}