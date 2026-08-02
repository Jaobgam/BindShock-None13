if (global.modo_de_jogo == 0) ativo = false; else ativo = true;

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
	if pode_mover
	{
		//Apertei pra cima
		if _up
		{
			pode_mover = false;
			alarm_set(0,15);
			m_vspd -= move_spd;
			obj_controler.sel_y--;
		}
		
		//Apertei pra baixo
		if _down
		{
			pode_mover = false;
			alarm_set(0,15);
			m_vspd += move_spd;
			obj_controler.sel_y++;
		}
		
		//Apertei pra direita
		if _right
		{
			pode_mover = false;
			alarm_set(0,15);
			m_hspd += move_spd;
			obj_controler.sel_x++;
		}
		
		//Apertei pra esquerda
		if _left
		{
			pode_mover = false;
			alarm_set(0,15);
			m_hspd -= move_spd;
			obj_controler.sel_x--;
		}
		

		
		
	
	}

}

x = lerp(x,m_hspd,.3);
y = lerp(y,m_vspd,.3);

