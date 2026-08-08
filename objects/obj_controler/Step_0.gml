//Modo de seleção: SELECIONAR ROBO
//Se ele estiver na room level 1, ativar modo tutorial
//if room == RoomLevel_1 {global.modo_tutorial = true} else {global.modo_tutorial = false}



if !instance_exists(obj_player_normal) exit;

//Mexer a celula
if (global.player_select == false)
{
	//Celula atual
	celula_atual_x = sel_x * tamanho_cel
	celula_atual_y = sel_y * tamanho_cel

	//Direita e esquerda
	if (keyboard_check_pressed(vk_right)) || keyboard_check_pressed(ord("D")) sel_x++;
	if (keyboard_check_pressed(vk_left)) || keyboard_check_pressed(ord("A")) sel_x--;

	//Cima Baixo
	if (keyboard_check_pressed(vk_up)) || keyboard_check_pressed(ord("W")) sel_y--;
	if (keyboard_check_pressed(vk_down)) || keyboard_check_pressed(ord("S")) sel_y++;

	//Pressionei pra direita e esquerda
	if (keyboard_check(vk_right)) || keyboard_check(ord("D")) {if delay_x1 >= 8 {sel_x++; delay_x1 = 0} else delay_x1++; if keyboard_check_released(vk_right) delay_x1 = 0} else delay_x1 = 0;
	if (keyboard_check(vk_left)) || keyboard_check(ord("A")) {if delay_x2 >= 8 {sel_x--; delay_x2 = 0} else delay_x2++; if keyboard_check_released(vk_left) delay_x2 = 0} else delay_x2 = 0;

	//Pressionei pra ccima e pra baixo
	if (keyboard_check(vk_up)) || keyboard_check(ord("W")) {if delay_y1 >= 8 {sel_y--; delay_y1 = 0} else delay_y1++; if keyboard_check_released(vk_up) delay_y1 = 0} else delay_y1 = 0;
	if (keyboard_check(vk_down)) || keyboard_check(ord("S")) {if delay_y2 >= 8 {sel_y++; delay_y2 = 0} else delay_y2++; if keyboard_check_released(vk_down) delay_y2 = 0} else delay_y2 = 0;

	//Desfazer alpha
	desfazer = false;
}
else
{	
	
	//Celula atual
	celula_atual_x = round(obj_player_normal.x)
	celula_atual_y = round(obj_player_normal.y)
	
	desfazer = true;
}
//show_debug_message(global.ativadores)
//Se eu pressionei enter em cima do player, mover ele
if (keyboard_check_pressed(vk_enter) && global.player_select == false)
{
	//Colisão do selecionavel
	var _col_p = collision_rectangle(celula_atual_x,celula_atual_y,celula_atual_x + tamanho_cel,celula_atual_y + tamanho_cel,obj_player_normal,false,false)
	var _col_n = collision_rectangle(celula_atual_x,celula_atual_y,celula_atual_x + tamanho_cel,celula_atual_y + tamanho_cel,obj_nucleo_verde,false,false)
	
	//Se eu estiver colidindo com o player e ele estiver desativado e player select for false
	if _col_p && _col_p.ativo == false && global.player_select == false
	{
		global.player_select = true
		_col_p.ativo = true
	}
	
	//Colisão com o nucleo de energia
	if _col_n && _col_n.ativo && global.player_select == false
	{
		
		//Sair do tutorial
		global.modo_tutorial = false;
		
		//Limpar array
		global.ativadores = [];
		
		//Verificar qual level ele esta
		switch(room)
		{
			case RoomLevel_1: transicao(RoomLevel_2) break;
			case RoomLevel_2: transicao(RoomLevel_3) break;
			case RoomLevel_3: transicao(RoomLevel_4) break;
			case RoomLevel_4: transicao(RoomLevel_5) break;
			case RoomLevel_5: transicao(RoomLevel_6) break;
			case RoomLevel_6: transicao(RoomLevel_7) break;
			case RoomLevel_7: transicao(RoomLevel_8) break;
			case RoomLevel_8: transicao(RoomLevel_9) break;
			case RoomLevel_9: transicao(RoomLevel_10) break;
			case RoomLevel_10: transicao(RoomFinalAgradecimentos) break;
		}
		
		//Se desfzer
		global.player_select = true
		
		//Editar Pos
		//sel_x = 9;
		//sel_y = 2;
		reinicio_pause = true;
		

	}
}
else if (keyboard_check_pressed(vk_enter) && global.player_select == true)
{
	//Se o modo player 
	global.player_select = false;
}


//Mudar posição da celula selecionada
if mudar
{
	sel_x = 9;
	sel_y = 2;
	
	mudar = false
}

	//if celula_atual_x == obj_player.x && celula_atual_y == obj_player.y
	
	//if collision_rectangle(celula_atual_x,celula_atual_y,celula_atual_x + tamanho_cel,celula_atual_y + tamanho_cel,obj_player,false,false)
	//{
	//	gay = true
	//} else gay = false
	
	//show_debug_message("gay: " +string(gay))

//Se eu pressionei ESQ, sair seleção do player


if (keyboard_check(ord("Z")))
{
	contage_reinicio++;
	_xscale = lerp(_xscale,1.4,.08)
	_yscale = lerp(_yscale,1.4,.08)
	dica_alpha = lerp(dica_alpha,1,.08)
}
else if (!keyboard_check(ord("Z")))
{
	_xscale = lerp(_xscale,1,.08)
	_yscale = lerp(_yscale,1,.08)
	dica_alpha = lerp(dica_alpha,.4,.08)
	contage_reinicio = 0;
}

//sE CONTAGEM reinicio for 60, reiniciar o level
if (contage_reinicio >= 60 && reinicio_delay <= 0)
{
	//Reiniciar o level
	transicao(room);
	
	//show_message("reinicado")
	//Limpar array
	global.ativadores = [];
	
	//Se desfzer
	global.player_select = true;
		
}


reinicio_delay--;

reinicio_delay = clamp(reinicio_delay,0,110)

//show_debug_message(reinicio_delay)

if (global.player_select == true) global.modo_de_jogo = 1; else global.modo_de_jogo = 0;



//Prender a sel
sel_x = clamp(sel_x,0,largura-1)
sel_y = clamp(sel_y,0,altura-1)

//show_debug_message(grid[sel_x][sel_y])
//show_debug_message("player select: " + string(global.player_select))
//show_debug_message("player x: " + string(obj_player_normal.x) + " player y: " + string(obj_player_normal.y))
//show_debug_message("x: " + string(celula_atual_x) + "  x2: " + string(sel_x * tamanho_cel + tamanho_cel))
//show_debug_message("y: " + string(celula_atual_y) + "  y2: " + string(sel_y * tamanho_cel + tamanho_cel))
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












