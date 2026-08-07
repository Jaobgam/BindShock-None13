image_speed = 0;
image_index = 0;

ligado				= false;	//Se ele esta ligado
em_move				= false;
player_move			= false;	//Se o objeto esta em movimento com o player
energia_qnt			= 0;		//Quantidade de energia (energia recebida - 1)
colisao				= "Nenhum";		//"Nenhum" - Nenhum, "Player" - Player, "Bloco" - Outro blocco
bloco				= [];

/*
	Como vai funcionar, o player naturalmente tem 1 de energia, se ele tivesse 2, o bloco que ele colou ia pegar uma energia pra ele
	e essa energia ia pra outro bloco.
	
	Vai ter blocos que vão ter energia infinita, dai teremos que conectar os conectores, desse bloco incial ao bloco final, e abrir o portão
*/

//Fonte de energia
fonte_lado = "Nenhum";

//Colisão de diferentes lados
travado_left = false;
travado_right = false;
travado_up = false;
travado_down = false;
_parado = true;

//Colisão com o player
_col_left	= 0;
_col_right	= 0;
_col_up		= 0;
_col_down	= 0;

//Se vai seguir ou não
seguir_x = true;
seguir_y = true;

//Ligado sprite
ligado_spr = false

//Aidionar]
adicionar = false

//Colisao com outro bloco
//Left
_col_left_solid		= 0;
_col_left_conect	= 0;
//Right
_col_right_solid	= 0;
_col_right_conect	= 0;
//Up
_col_up_solid		= 0;
_col_up_conect		= 0;
//Down
_col_down_solid		= 0;
_col_down_conect	= 0;

//Colisao com o player
_col_player = 0;

//Depois de 20 frames se não houver colisão, então ele desliga pra valer
desliga_time = 0;
desliga_time_max = 15;


//Editar de novo porra
//sprite_index = (sprite_usado == noone) ? spr_objeto_conector_quatro : sprite_usado