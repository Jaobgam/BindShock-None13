if (global.obrigado_joga)
{
	draw_set_font(fnt_monogram_48)
	draw_set_alpha(1)
	draw_set_color(c_white)
	
	var xx = display_get_gui_width() * .4
	var yy = display_get_gui_height() * .16
	
	draw_text_scribble(xx,yy,"[wave][shake][cycle,120,240,58,177]OBRIGADO POR JOGAR!!!!![/wave][/shake][/cycle]")


	draw_set_font(-1)
	draw_set_alpha(1)

}