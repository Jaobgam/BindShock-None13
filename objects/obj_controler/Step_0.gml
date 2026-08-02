//Modo de seleção: SELECIONAR ROBO
	



//Mexer a celula
if (global.player_select == false)
{
	//Celula atual
	celula_atual_x = sel_x * tamanho_cel
	celula_atual_y = sel_y * tamanho_cel

	//Direita e esquerda
	if (keyboard_check_pressed(vk_right)) sel_x++;
	if (keyboard_check_pressed(vk_left)) sel_x--;

	//Cima Baixo
	if (keyboard_check_pressed(vk_up)) sel_y--;
	if (keyboard_check_pressed(vk_down)) sel_y++;

	//Pressionei pra direita e esquerda
	if (keyboard_check(vk_right)) {if delay_x1 >= 8 {sel_x++; delay_x1 = 0} else delay_x1++; if keyboard_check_released(vk_right) delay_x1 = 0} else delay_x1 = 0;
	if (keyboard_check(vk_left)) {if delay_x2 >= 8 {sel_x--; delay_x2 = 0} else delay_x2++; if keyboard_check_released(vk_left) delay_x2 = 0} else delay_x2 = 0;

	//Pressionei pra ccima e pra baixo
	if (keyboard_check(vk_up)) {if delay_y1 >= 8 {sel_y--; delay_y1 = 0} else delay_y1++; if keyboard_check_released(vk_up) delay_y1 = 0} else delay_y1 = 0;
	if (keyboard_check(vk_down)) {if delay_y2 >= 8 {sel_y++; delay_y2 = 0} else delay_y2++; if keyboard_check_released(vk_down) delay_y2 = 0} else delay_y2 = 0;

	//Desfazer alpha
	desfazer = false;
}
else
{	
	
	//Celula atual
	celula_atual_x = round(obj_player.x)
	celula_atual_y = round(obj_player.y)
	
	desfazer = true;
}

//Se eu pressionei enter em cima do player, mover ele
if (keyboard_check_pressed(vk_enter))
{
	//Verificar se o player existe naquela posição
	if collision_rectangle(celula_atual_x,celula_atual_y,celula_atual_x + tamanho_cel,celula_atual_y + tamanho_cel,obj_player,false,false)
	{
		global.player_select = true
	}	
}

	//if celula_atual_x == obj_player.x && celula_atual_y == obj_player.y
	
	if collision_rectangle(celula_atual_x,celula_atual_y,celula_atual_x + tamanho_cel,celula_atual_y + tamanho_cel,obj_player,false,false)
	{
		gay = true
	} else gay = false
	
	show_debug_message("gay: " +string(gay))

//Se eu pressionei ESQ, sair seleção do player
if (keyboard_check_pressed(vk_escape) && global.player_select == true)
{
	//Se o modo player 
	global.player_select = false;
}

	
	
if (global.player_select == true) global.modo_de_jogo = 1; else global.modo_de_jogo = 0;



//Prender a sel
sel_x = clamp(sel_x,0,largura-1)
sel_y = clamp(sel_y,0,altura-1)

show_debug_message(grid[sel_x][sel_y])
show_debug_message("player select: " + string(global.player_select))
show_debug_message("player x: " + string(obj_player.x) + " player y: " + string(obj_player.y))
show_debug_message("x: " + string(celula_atual_x) + "  x2: " + string(sel_x * tamanho_cel + tamanho_cel))
show_debug_message("y: " + string(celula_atual_y) + "  y2: " + string(sel_y * tamanho_cel + tamanho_cel))
//show_debug_message("sel_x * tamanho_cel: " + string(sel_x * tamanho_cel))
//show_debug_message("alpha: " + string(alpha))


/*
//Pressionar Enter e verificar se tem algo
if (keyboard_check_pressed(vk_enter))
{
	//Verificar se a celula selecionada tem algo
	if (sel_x && sel_y)
	{
		//Verificar se na grid existe aquela variavel
		if grid[sel_x][sel_y]
	}
	else
	{
		show_message("nao tem nada")	
	}
}












