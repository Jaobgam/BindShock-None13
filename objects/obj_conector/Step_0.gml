//Colisão na direita
var _col_left = collision_rectangle(x,y,x - 20,y + sprite_height,obj_player_normal,false,false)
var _col_right = collision_rectangle(x + sprite_width,y,x + sprite_height + 20,y + sprite_height,obj_player_normal,false,false)
var _col_up = collision_rectangle(x,y,x + sprite_width,y - 20,obj_player_normal,false,false)
var _col_down = collision_rectangle(x,y + sprite_height,x + sprite_width,y + sprite_height + 20,obj_player_normal,false,false)
	
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
	ligado = true	
} else ligado = false