if (ligado)
{
	//Mudar de sprite
	image_index = 1;
	//em_move = true
	

	
}
else {image_index = 0;}

if em_move
{
	//Agora a posição dele vai ser baseada na posição do player
	x += obj_player_normal.x - obj_player_normal.xprevious
	y += obj_player_normal.y - obj_player_normal.yprevious	
}