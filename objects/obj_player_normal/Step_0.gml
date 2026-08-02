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
				} }
			
		#endregion
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

show_debug_message("robos ligados: " + string(robos_em_ligacao))

x = lerp(x,m_hspd,.3);
y = lerp(y,m_vspd,.3);

