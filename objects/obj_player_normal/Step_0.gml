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
	//Se ele pode mover

	#region Movimentação
	
	/*
	if pode_mover
	{
		//Apertei pra cima
		if _up
		{
			//Variaveis
			pode_mover = false;
			alarm_set(0,15);
			
			//Colisão com bloco conector
			var _col = instance_place(x,y-32,obj_conector)
			
			//Colisão com o bloco normal
			var _col_b = place_meeting(x,y-32,obj_solido) || (_col != noone && (_col.ligado == false || _col.travado_up == true))
			
			if !_col_b
			{
				m_vspd -= move_spd;
				obj_controler.sel_y--;
				
				//Se eu estou me movendo, não ativar
				if pode_mover == false in_move = true
				} }
	}
	
	if pode_mover
	{
		
		//Apertei pra baixo
		if _down
		{
			//Variaveis
			pode_mover = false;
			alarm_set(0,15);
			
			//Colisão com bloco conector
			var _col = instance_place(x,y+32,obj_conector)
			
			//Colisão com o bloco normal
			var _col_b = place_meeting(x,y+32,obj_solido) || (_col != noone && (_col.ligado == false || _col.travado_down == true))
			
			if !_col_b
			{
				m_vspd += move_spd;
				obj_controler.sel_y++;
				
				//Se eu estou me movendo, não ativar
				if pode_mover == false in_move = true
				} }
	}		
	
	if pode_mover
	{	
		//Apertei pra direita
		if _right
		{
			//Variaveis
			pode_mover = false;
			alarm_set(0,15);
			
			
			//Colisão com bloco conector
			var _col = instance_place(x+32,y,obj_conector)
			
			//Colisão com o bloco normal
			var _col_b = place_meeting(x+32,y,obj_solido) || (_col != noone && (_col.ligado == false || _col.travado_right == true))
			
			show_debug_message("_colb: " +string(_col_b))
			
			if !_col_b
			{
				m_hspd += move_spd;
				obj_controler.sel_x++;
				in_move = true
				} }
	}*/
	
	if pode_mover
	{
		if (_right && pode_mover_bloco(32, 0, "travado_right"))
		{
			pode_mover = false;
			alarm_set(0,15);
			m_hspd += move_spd;
			obj_controler.sel_x++;
			in_move = true;
		}
		else if (_left && pode_mover_bloco(-32, 0, "travado_left"))
		{
			pode_mover = false;
			alarm_set(0,15);
			m_hspd -= move_spd;
			obj_controler.sel_x--;
			in_move = true;
		}
		else if (_up && pode_mover_bloco(0, -32, "travado_up"))
		{
			pode_mover = false;
			alarm_set(0,15);
			m_vspd -= move_spd;
			obj_controler.sel_y--;
			in_move = true;
		}
		else if (_down && pode_mover_bloco(0, 32, "travado_down"))
		{
			pode_mover = false;
			alarm_set(0,15);
			m_vspd += move_spd;
			obj_controler.sel_y++;
			in_move = true;
		}
	}
	
	#endregion
	
	//Ativar energia dele
	if keyboard_check_pressed(ord("Q")) 
	{
		//Verificar se ele pode andar
		if in_move == false
		{
			energia = !energia;
		}
	}
	
	//Verficar se o player está energizado
	if energia
	{
		//Gasto de energia vai ser 1
		player_energia.energia_gasto = 1;
		
		//Ele vai se adicionar no cconecctado se ele estiver ligado
		//Se ele não estiver sido adicionado
		if !array_contains(robos_em_ligacao,id)
		{
			//Se adicionar
			array_insert(robos_em_ligacao,0,id)		
		}
	
		//Se ele estiver energizado
		//Vamos verificar se ele vai colidir com alguém
		//Colisão na esquerda
		_col_left	= collision_rectangle(x,y,x - 20,y + sprite_height,obj_conector,false,false)
		_col_right	= collision_rectangle(x + sprite_width,y,x + sprite_height + 20,y + sprite_height,obj_conector,false,false)
		_col_up		= collision_rectangle(x,y,x + sprite_width,y - 20,obj_conector,false,false)
		_col_down	= collision_rectangle(x,y + sprite_height,x + sprite_width,y + sprite_height + 20,obj_conector,false,false)
		
		//Colisão na esquerda
		if _col_left
		{	
			//So vai adicionar se o valor nao tiver dentro
			if !array_contem_valor(player_energia._left.conectado,_col_left)
			{
				//Adicionar o objeto colidido na variavel
				array_push(player_energia._left.conectado,_col_left.id)
			
				//Verificar se o ultimo valor existe (oq signifiaca que ele ja estava encostando em outro)
				if player_energia._left.ultimo_valor != noone
				{
					//Atualizar valor antes de limpar
					//player_energia._left.ultimo_valor.ligado = false;
					
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
			//player_energia._left.energia += 1; 
			array_limpar(player_energia._left.conectado,player_energia._left.ultimo_valor); 
			player_energia._left.ultimo_valor = noone;
		}
		
		
		//Colisão na direita
		if _col_right
		{
			//Tirar energia da direita
			//player_energia._right.energia = 0;
			
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
			//player_energia._right.energia = 1; 
			array_limpar(player_energia._right.conectado,player_energia._right.ultimo_valor); 
			player_energia._right.ultimo_valor = noone;
		}
		
		
		//Colisão na cima
		if _col_up
		{
			//Tirar energia de cima
			//player_energia._up.energia = 0;
			
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
		//if (player_energia._left.ultimo_valor != noone) {player_energia._left.ultimo_valor.ligado = false;}
		player_energia._left.ultimo_valor = noone;
		
		//Direita
		player_energia._right.energia = 1;
		player_energia._right.conectado = [];
		//if (player_energia._right.ultimo_valor != noone) {player_energia._right.ultimo_valor.ligado = false;}
		player_energia._right.ultimo_valor = noone;
		
		//Cima
		player_energia._up.energia = 1;
		player_energia._up.conectado = [];
		//if (player_energia._up.ultimo_valor != noone) {player_energia._up.ultimo_valor.ligado = false;}
		player_energia._up.ultimo_valor = noone;
		
		//Baixo
		player_energia._down.energia = 1;
		player_energia._down.conectado = [];
		//f (player_energia._down.ultimo_valor != noone) {player_energia._down.ultimo_valor.ligado = false;}
		player_energia._down.ultimo_valor = noone;
		
		//Gasto de energia
		player_energia.energia_gasto = 0;
	}

}
else
{
	//Se o robo estiver desativado
	//Verificar se ele está ligado ccom outro robo
	//Se ele nao estiver ligado com outro robo
	if !energia
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

////Verificar se o player chegou
//if abs(x - m_hspd) < 1 && abs(y - m_vspd) < 1
//{
//    in_move = false
//}

//
//
//show_debug_message("Conectado: " + string(player_energia._left.conectado))
		//show_debug_message("robos ligados: " + string(robos_em_ligacao))
		//show_debug_message("energia: " + string(energia))
		//show_debug_message("left.energia: " + string(player_energia._left.energia))
		//show_debug_message("player_energia.energia_gasto: " + string(player_energia.energia_gasto))
//show_debug_message("Energia left: " + string(player_energia._left.energia))
//show_debug_message("Energia left Conectado: " + string(player_energia._left.conectado))
//show_debug_message("ultimo_valor: " + string(player_energia._left.ultimo_valor))


//show_debug_message("Energia right: " + string(player_energia._right.energia))
//show_debug_message("Energia right Conectado: " + string(player_energia._right.conectado))
//show_debug_message("ultimo_valor: " + string(player_energia._right.ultimo_valor))


//show_debug_message("Energia up: " + string(player_energia._up.energia))
//show_debug_message("Energia up Conectado: " + string(player_energia._up.conectado))
//show_debug_message("ultimo_valor: " + string(player_energia._up.ultimo_valor))


//show_debug_message("Energia down: " + string(player_energia._down.energia))
//show_debug_message("Energia down Conectado: " + string(player_energia._down.conectado))
//show_debug_message("ultimo_valor: " + string(player_energia._down.ultimo_valor))

x = lerp(x,m_hspd,.3);
y = lerp(y,m_vspd,.3);

//Verifica se já chegou perto o suficiente do alvo
if abs(x - m_hspd) < 1 && abs(y - m_vspd) < 1
{
    //Se ele ainda estava em movimento, agora chegou -> trava certinho na grid
    if in_move == true
    {
        x = m_hspd; //gruda no valor exato, sem sobrar fração
        y = m_vspd;
        in_move = false;
    }
}
