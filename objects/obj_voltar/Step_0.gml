if (keyboard_check_pressed(vk_enter))
{
	voltar = true
	transicao(rm_menu_iniciar)
}

if (voltar)
{
	alpha = lerp(alpha,0,.3)
}