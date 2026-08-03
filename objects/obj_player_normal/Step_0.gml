if (global.modo_de_jogo == 0) ativo = false;

//Variaveis de ccontrole
var _up, _down, _left, _right

_up = keyboard_check(vk_up)
_down = keyboard_check(vk_down)
_left = keyboard_check(vk_left)
_right = keyboard_check(vk_right)

//Se o player estiver selecionado ele pode se mvoer
if ativo
{
	//Ele vai se adicionar no cconecctado
	//Se ele não estiver sido adicionado
	if !array_contains(robos_em_ligacao,id)
	{
		//Se adicionar
		array_insert(robos_em_ligacao,0,id)		
	}
	
	
	//Se ele pode mover
	if pode_mover
	{
		#region Movimentação
		
		//Apertei pra cima
		if _up
		{
			pode_mover = false;
			alarm_set(0,15);
			if !place_meeting(x,y-32,obj_solido)
			{
				m_vspd -= move_spd;
				obj_controler.sel_y--;
				
				//Se eu estou me movendo, não ativar
				if pode_mover == false in_move = true
				} }
				
		
		//Apertei pra baixo
		if _down
		{
			pode_mover = false;
			alarm_set(0,15);
			if !place_meeting(x,y+32,obj_solido)
			{
				m_vspd += move_spd;
				obj_controler.sel_y++;
				
				//Se eu estou me movendo, não ativar
				if pode_mover == false in_move = true
				} }
				
		
		//Apertei pra direita
		if _right
		{
			pode_mover = false;
			alarm_set(0,15);
			if !place_meeting(x+32,y,obj_solido)
			{
				m_hspd += move_spd;
				obj_controler.sel_x++;
				
				//Se eu estou me movendo, não ativar
				if pode_mover == false in_move = true
				} }
		
		
		//Apertei pra esquerda
		if _left
		{
			pode_mover = false;
			alarm_set(0,15);
			if !place_meeting(x-32,y,obj_solido)
			{
				m_hspd -= move_spd;
				obj_controler.sel_x--;
				
				//Se eu estou me movendo, não ativar
				if pode_mover == false in_move = true
				} }
				
			
		#endregion
	}
	
	//Ativar energia dele
	if keyboard_check_pressed(ord("Q")) energia = !energia; 
	
	//Verficar se o player está energizado
	if energia
	{
		//Se ele estiver energizado
		//Vamos verificar se ele vai colidir com alguém
		//Colisão na esquerda
		var _col_left = collision_rectangle(x,y,x - 20,y + sprite_height,obj_conector,false,false)
		var _col_right = collision_rectangle(x + sprite_width,y,x + sprite_height + 20,y + sprite_height,obj_conector,false,false)
		var _col_up = collision_rectangle(x,y,x + sprite_width,y - 20,obj_conector,false,false)
		var _col_down = collision_rectangle(x,y + sprite_height,x + sprite_width,y + sprite_height + 20,obj_conector,false,false)
		
		//Colisão na esquerda
		if _col_left
		{
			//Tirar energia da esquerda
			player_energia._left.energia = 0;
			
			//So vai adicionar se o valor nao tiver dentro
			if !array_contem_valor(player_energia._left.conectado,_col_left)
			{
				//Adicionar o objeto colidido na variavel
				array_push(player_energia._left.conectado,_col_left.id)
			
				//Verificar se o ultimo valor existe (oq signifiaca que ele ja estava encostando em outro)
				if player_energia._left.ultimo_valor != noone
				{
					//Atualizar valor antes de limpar
					player_energia._left.ultimo_valor.ligado = false;
					
					//Limpar ultimo valor antes de atualizar para o proximo
					array_limpar(player_energia._left.conectado,player_energia._left.ultimo_valor);
				}
				
				//Ativar o proximo bot
				//_col_left.ligado = true;
				
				//Atualizar ultimo valor
				player_energia._left.ultimo_valor = _col_left.id
				
			} 
			
		} else {
			//if (player_energia._left.ultimo_valor != noone) {player_energia._left.ultimo_valor.ligado = false;}
			player_energia._left.energia = 1; 
			array_limpar(player_energia._left.conectado,player_energia._left.ultimo_valor); 
			player_energia._left.ultimo_valor = noone;
		}
		
		
		//Colisão na direita
		if _col_right
		{
			//Tirar energia da direita
			player_energia._right.energia = 0;
			
			//So vai adicionar se o valor nao tiver dentro
			if !array_contem_valor(player_energia._right.conectado,_col_right)
			{
				//Adicionar o objeto colidido na variavel
				array_push(player_energia._right.conectado,_col_right.id)
				
				//Verificar se o ultimo valor existe (oq signifiaca que ele ja estava encostando em outro)
				if player_energia._right.ultimo_valor != noone
				{
					//Limpar ultimo valor antes de atualizar para o proximo
					array_limpar(player_energia._right.conectado,player_energia._right.ultimo_valor);
				}
				
				//Atualizar ultimo valor
				player_energia._right.ultimo_valor = _col_right.id
			} 
			
		} else {
			player_energia._right.energia = 1; 
			array_limpar(player_energia._right.conectado,player_energia._right.ultimo_valor); 
			player_energia._right.ultimo_valor = noone;
		}
		
		
		//Colisão na cima
		if _col_up
		{
			//Tirar energia de cima
			player_energia._up.energia = 0;
			
			//So vai adicionar se o valor nao tiver dentro
			if !array_contem_valor(player_energia._up.conectado,_col_up)
			{
				//Adicionar o objeto colidido na variavel
				array_push(player_energia._up.conectado,_col_up.id)
				
				//Verificar se o ultimo valor existe (oq signifiaca que ele ja estava encostando em outro)
				if player_energia._up.ultimo_valor != noone
				{
					//Limpar ultimo valor antes de atualizar para o proximo
					array_limpar(player_energia._up.conectado,player_energia._up.ultimo_valor);
				}
				
				//Atualizar ultimo valor
				player_energia._up.ultimo_valor = _col_up.id
			}

		} else {player_energia._up.energia = 1; array_limpar(player_energia._up.conectado,player_energia._up.ultimo_valor); player_energia._up.ultimo_valor = noone;}
		
		
		//Colisão na baixa
		if _col_down
		{
			//Tirar energia de baix
			player_energia._down.energia = 0;
			
			//So vai adicionar se o valor nao tiver dentro
			if !array_contem_valor(player_energia._down.conectado,_col_down)
			{
				//Adicionar o objeto colidido na variavel
				array_push(player_energia._down.conectado,_col_down.id)

				//Verificar se o ultimo valor existe (oq signifiaca que ele ja estava encostando em outro)
				if player_energia._down.ultimo_valor != noone
				{
					//Limpar ultimo valor antes de atualizar para o proximo
					array_limpar(player_energia._down.conectado,player_energia._down.ultimo_valor);
				}
				
				//Atualizar ultimo valor
				player_energia._down.ultimo_valor = _col_down.id
			}
		} else {player_energia._down.energia = 1; array_limpar(player_energia._down.conectado,player_energia._down.ultimo_valor); player_energia._down.ultimo_valor = noone;}
		
		//energia = clamp(energia,0,1)
	}
	else
	{
		//Reniciar os valores
		//Esquerda
		player_energia._left.energia = 1;
		player_energia._left.conectado = [];
		if (player_energia._left.ultimo_valor != noone) {player_energia._left.ultimo_valor.ligado = false;}
		player_energia._left.ultimo_valor = noone;
		
		//Direita
		player_energia._right.energia = 1;
		player_energia._right.conectado = [];
		if (player_energia._right.ultimo_valor != noone) {player_energia._right.ultimo_valor.ligado = false;}
		player_energia._right.ultimo_valor = noone;
		
		//Cima
		player_energia._up.energia = 1;
		player_energia._up.conectado = [];
		if (player_energia._up.ultimo_valor != noone) {player_energia._up.ultimo_valor.ligado = false;}
		player_energia._up.ultimo_valor = noone;
		
		//Baixo
		player_energia._down.energia = 1;
		player_energia._down.conectado = [];
		if (player_energia._down.ultimo_valor != noone) {player_energia._down.ultimo_valor.ligado = false;}
		player_energia._down.ultimo_valor = noone;
	}

}
else
{
	//Se o robo estiver desativado
	//Verificar se ele está ligado ccom outro robo
	//Se ele nao estiver ligado com outro robo
	if !robo_conectado
	{
		//Verificar se tem algo na array
		if array_contains(robos_em_ligacao,id)
		{
			//Se tiver ele vai limpar a array
			//Ele vai limpar a array
			robos_em_ligacao = []
		}
	}
}

//Trocar sprite
sprite_index = (energia == false) ? spr_player : spr_player_energia;

show_debug_message("robos ligados: " + string(robos_em_ligacao))
show_debug_message("energia: " + string(energia))


show_debug_message("Energia left: " + string(player_energia._left.energia))
show_debug_message("Energia left Conectado: " + string(player_energia._left.conectado))
show_debug_message("ultimo_valor: " + string(player_energia._left.ultimo_valor))


show_debug_message("Energia right: " + string(player_energia._right.energia))
show_debug_message("Energia right Conectado: " + string(player_energia._right.conectado))
show_debug_message("ultimo_valor: " + string(player_energia._right.ultimo_valor))


show_debug_message("Energia up: " + string(player_energia._up.energia))
show_debug_message("Energia up Conectado: " + string(player_energia._up.conectado))
show_debug_message("ultimo_valor: " + string(player_energia._up.ultimo_valor))


show_debug_message("Energia down: " + string(player_energia._down.energia))
show_debug_message("Energia down Conectado: " + string(player_energia._down.conectado))
show_debug_message("ultimo_valor: " + string(player_energia._down.ultimo_valor))

x = lerp(x,m_hspd,.3);
y = lerp(y,m_vspd,.3);

