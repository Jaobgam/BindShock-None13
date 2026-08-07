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
	
	draw_set_alpha(modo_tutorial_alpha)
	
	//Se modo tutorial não foi completo, então começar ele
	if !global.modo_tutorial_completo
	{
		//Dica 1
		if (modo_tutorial_dica == 0)
		{
			draw_text(_gui_w,_gui_h,"Use WASD para mexer e ENTER para selecionar Player")
		
			//Se ele apertar enter, modo tutorial ta feito
			if keyboard_check_pressed(vk_enter) {modo_tutorial_dica_feito = true;}
		}
		else if (modo_tutorial_dica == 1)
		{
			draw_text(_gui_w,_gui_h,"Use WASD para mexer o player e P para ligar e desligar.")
			
			if keyboard_check_pressed(ord("Q")) {modo_tutorial_dica_feito = true}
		}
		else if (modo_tutorial_dica == 2)
		{
			draw_text(_gui_w,_gui_h,"Encoste nos blocos e os mova até o circuito")
			
			if global.abrir_level modo_tutorial_dica_feito = true;
		}
		else if (modo_tutorial_dica == 3)
		{
			draw_text(_gui_w,_gui_h,"Aperte Backspace para sair do player e selecione o nucleo verde.")
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
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	
	draw_text_transformed(_gui_w,_gui_h,"Pressione P para reiniciar.",_xscale,_yscale,1)
	
	draw_set_valign(-1)
	draw_set_halign(-1)
}


draw_set_alpha(1)
draw_set_colour(c_white)