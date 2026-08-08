if ativo == true image_index = 1 else image_index = 0

//Colisão com bloco de energia, esperar receber energia do bloco
var _col_left_ativ		= collision_rectangle(x,y+5,x - 20,(y + sprite_height)-5,									obj_conector,false,false)
var _col_right_ativ		= collision_rectangle(x + sprite_width,y+5,x + sprite_width + 20,(y + sprite_height)-5,		obj_conector,false,false)
var _col_up_ativ		= collision_rectangle(x+5,y,(x + sprite_width)-5,y - 20,									obj_conector,false,false)
var _col_down_ativ		= collision_rectangle(x+5,y + sprite_height,(x + sprite_width)-5,y + sprite_height + 20,	obj_conector,false,false)

ativa_left	= _col_left_ativ
ativa_right = _col_right_ativ
ativa_up	= _col_up_ativ
ativa_down	= _col_down_ativ

//Verificar qual lado ele está ligado
//Se o ativador está colidindo com o bloco de energia (conector) || //Verificar se o outro bloco está ligado
if (cima)		{if (ativa_up) {if ativa_up.ligado			== true && ativa_up.energia		== true && ativa_up.at_baixo		== true {ativo = true;} else {ativo = false;}} else {ativo = false;}} 
if (baixo)		{if (ativa_down) {if ativa_down.ligado		== true && ativa_down.energia	== true && ativa_down.at_cima		== true {ativo = true;} else {ativo = false;}} else {ativo = false;}} 
if (direita)	{if (ativa_right) {if ativa_right.ligado	== true && ativa_right.energia	== true && ativa_right.at_esquerda	== true {ativo = true;} else {ativo = false;}} else {ativo = false;}} 
if (esquerda)	{if (ativa_left) {if ativa_left.ligado		== true && ativa_left.energia	== true && ativa_left.at_direita	== true {ativo = true;} else {ativo = false;}} else {ativo = false;}} 

//show_debug_message(ativo)

/*
if ativa_left || ativa_right || ativa_up || ativa_down
{
	
}


//Verificar se ele está recebendo energia
if(ligado)
{
	if _col_left_ativ {with(_col_left_ativ){} else {show_debug_message("of")}
}
else
{
	//Está desligado
	show_debug_message("of")
}