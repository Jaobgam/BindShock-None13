
//Se desfazer
if desfazer == true
{
	if alpha <= .4
	{
		alpha = lerp(alpha,0,.3);
	}
}
else if desfazer == false
{
	alpha = lerp(alpha,.4,.3);
}

	//Alpha
	draw_set_alpha(alpha)
	//Ficar azul
	draw_set_colour(c_blue)
	
	//Desenhar quadrado selecionado nas linhas
	//draw_rectangle(sel_x * tamanho_cel, sel_y * tamanho_cel, sel_x * tamanho_cel + tamanho_cel, sel_y * tamanho_cel + tamanho_cel, false);

	frame += 0.1;

	if (frame >= sprite_get_number(spr_selecao))
	    frame = 0;

	//Desenhar sprite
	draw_sprite(spr_selecao,frame,sel_x * tamanho_cel, sel_y * tamanho_cel)
	
	//show_debug_message("Celula Selecionada_x: " + string(sel_x))
	//show_debug_message("Celula Selecionada_y: " + string(sel_y))

draw_set_color(c_yellow)
draw_set_alpha(1)

	//Dsenhar Numeros nas linhas
	//numero_linhas()

draw_set_alpha(.2)
draw_set_color(c_black)

	//Desenhar linhas
	//criar_linhas();

draw_set_alpha(1)