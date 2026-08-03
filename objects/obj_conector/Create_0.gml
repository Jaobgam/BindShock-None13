image_speed = 0;
image_index = 0;

ligado = false; //Se ele esta ligado
em_move = false;
player_move = false; //Se o objeto esta em movimento com o player

//Colisão de diferentes lados
travado_left = false;
travado_right = false;
travado_up = false;
travado_down = false;
_parado = true;

//Depois de 20 frames se não houver colisão, então ele desliga pra valer
desliga_time = 0;
desliga_time_max = 20;


//Editar de novo porra
//sprite_index = (sprite_usado == noone) ? spr_objeto_conector_quatro : sprite_usado