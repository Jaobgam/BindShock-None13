draw_set_color(c_black)

//var i = 0
//draw_text(0,0 + i,"SETINHAS - para mover") i += 30;
//draw_text(0,0 + i,"ENTER no PLAYER - para mudar modo de jogo") i += 30;
//draw_text(0,0 + i,"ESC - para PARAR de controlar o player") i += 30;
//draw_text(0,0 + i,"Q - para ATIVAR a energia do player") i += 30;



//Modo tutorial
//ativou modo tutorial
if (global.modo_tutorial)
{
	//Pegar valor da room
	var _gui_w = display_get_gui_width() / 2
	var _gui_h = display_get_gui_height() * .14
	
	//Alinhar texto
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	
	//draw_set_font(fnt_monogram)
	draw_set_color(c_white)
	
	draw_set_alpha(modo_tutorial_alpha)
	
	if (room == RoomLevel_1)
	{
		//Se modo tutorial não foi completo, então começar ele
		if !global.modo_tutorial_completo
		{
			//Dica 1
			if (modo_tutorial_dica == 0)
			{
				draw_text_scribble(_gui_w, _gui_h, "Use [spr_teclado_wasd] para mexer e [spr_teclado_enter] para selecionar o player")
				//draw_text(_gui_w,_gui_h,"Use WASD para mexer e ENTER para selecionar Player")
		
				//Se ele apertar enter, modo tutorial ta feito
				if keyboard_check_pressed(vk_enter) {modo_tutorial_dica_feito = true;}
			}
			else if (modo_tutorial_dica == 1)
			{
				draw_text_scribble(_gui_w,_gui_h,"Use [spr_teclado_wasd] para movimentar o player e [spr_teclado_PQ] para ligar e desligar.")
			
				if keyboard_check_pressed(ord("Q")) || keyboard_check_pressed(ord("P")) {modo_tutorial_dica_feito = true}
			}
			else if (modo_tutorial_dica == 2)
			{
				draw_text_scribble(_gui_w,_gui_h,"Encoste nos blocos e os mova até o circuito")
			
				if global.abrir_level modo_tutorial_dica_feito = true;
			}
			else if (modo_tutorial_dica == 3)
			{
				draw_text_scribble(_gui_w,_gui_h,"Aperte [spr_teclado_enter] para sair do player e selecione o nucleo verde.")
			}
		}
	}
	else if (room == RoomLevel_3)
	{
		//Se o tutorial não estiver completo
		if !global.modo_tutorial_completo
		{
			if (modo_tutorial_dica == 0)
			{
				draw_text_scribble(_gui_w, _gui_h, "Você pode selecionar um conector com [spr_teclado_enter] para tranca-ló.")
				//draw_text(_gui_w,_gui_h,"Use WASD para mexer e ENTER para selecionar Player")
		
				//Se ele apertar enter, modo tutorial ta feito
				if keyboard_check_pressed(vk_enter) {modo_tutorial_dica_feito = true;}
			}
		}
	}
	
	draw_set_valign(-1)
	draw_set_halign(-1)
	
	
	//Se moto tutorial ta feito, diminuir alpha
	if modo_tutorial_dica_feito == true && !entrar
	{
		if modo_tutorial_alpha > 0
		{
			//Diminuir alpha até zero
			modo_tutorial_alpha = lerp(modo_tutorial_alpha,0,.3);
		}
	
		if modo_tutorial_alpha <= 0 {entrar = true; modo_tutorial_dica++; modo_tutorial_dica_feito = false;}
	}
	
	if entrar
	{
		//Diminuir alpha até zero
		modo_tutorial_alpha = lerp(modo_tutorial_alpha,1,.3);
		
		if modo_tutorial_alpha >= 1 {entrar = false}
	}
	
	draw_set_alpha(1)
	
	
	//show_debug_message(modo_tutorial_alpha)
}

//Dica de reiniciar
draw_set_alpha(dica_alpha)


if global.dica_reiniciar
{
	//Pegar valor da room
	var _gui_w = display_get_gui_width() * .78
	var _gui_h = display_get_gui_height() * .09
	//draw_set_valign(fa_middle)
	//raw_set_halign(fa_center)
	
	//Texto
	var _text = scribble("Pressione Z para reiniciar.")
	
	//Texto config
	_text.starting_format("fnt_monogram", c_black)
	_text.align(fa_center, fa_middle)
	_text.transform(_xscale,_yscale,1)
	_text.blend(c_black, dica_alpha)
	_text.draw(_gui_w,_gui_h);
	
	//draw_set_valign(-1)
	//draw_set_halign(-1)
}



draw_set_alpha(1)
draw_set_colour(c_white)