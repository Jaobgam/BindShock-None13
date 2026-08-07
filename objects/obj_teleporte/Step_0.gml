//Se o objeto conector estiver na mesma posição, ele vai se teletransportar para o outro bloco
var _inst = instance_place(x,y,obj_conector)

if (_inst && _inst._parado)
{
	//Verificar se pode teletransportar
	if (!teleporte_feito)
	{
		//Verificar se tem outro teletransportador
		if (outro_teleporte_id != noone)
		{
			//Verificar se no outro teletransportador não tem nada em cima
			if (!outro_teleporte_id.em_cima)
			{
				//Teletransportar para o proximo
				_inst.x = outro_teleporte_id.x
				_inst.y = outro_teleporte_id.y
				outro_teleporte_id.teleporte_feito = true;
				outro_teleporte_id.em_cima = true
			}
		}
	}
}
else
{
	//Se não ta mais em cima, começar delay
	if em_cima = true
	{
		em_cima_delay--;
	}
	
	
	teleporte_feito = false;	
}

////Se não tiver em cima, liberar de novo
if (em_cima_delay <= 0)
{
	em_cima = false;	
	em_cima_delay = 60;
}

//show_debug_message("em cima delay: " + string(em_cima_delay) + " em cima: " + string(em_cima) + " id: " +string(id))