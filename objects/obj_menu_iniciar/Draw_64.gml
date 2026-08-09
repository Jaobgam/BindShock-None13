//Desenhar opções
//Desfazer alfa



//Quantidade de opções
var _qnt = array_length(opcoes)

//Distancia de uma opção pra outra
var _dis = 48;

//Desenhar na room
var _xx = display_get_gui_width() / 2
var _yy = display_get_gui_height() / 2

// Desenhar opções na room
for (var i = 0; i < _qnt; i++)
{	
	scribble_anim_wave(2, 2, 2)
	
	if sel == i 
	{
		escala[i] = lerp(escala[i],1.4,.15)	
		sel_s = 1
	}
	else
	{
		escala[i] = lerp(escala[i],1,.15)
		sel_s = 0
	}
	
	if (tranca)
	{
		alpha = lerp(alpha,0,.085)	
	}
	
    var _text = scribble(shake[sel_s][0] + opcoes[i] + shake[sel_s][0]);

    _text.starting_format("fnt_monogram_48", c_white);
    _text.align(fa_center, fa_middle);
    _text.scale(escala[i]);
    _text.blend(image_blend, alpha)
    _text.draw(_xx, _yy + (_dis * i));
	
	//Resetar animação
	//scribble_anim_reset()
}

if !tranca
{
	if keyboard_check_pressed(vk_up) || keyboard_check(ord("W"))
	{
		sel--;
	}
	else if keyboard_check_pressed(vk_down) || keyboard_check(ord("S"))
	{
		sel++;	
	}
}


//Checar onde está selecionado e oq acontece se apertar
switch(sel)
{
	case 0:	if (keyboard_check_pressed(vk_enter)) {transicao(RoomLevel_1); tranca = true; audio_play_sound(select,100,false)} break;
	case 1:	if (keyboard_check_pressed(vk_enter)) {transicao(rm_menu_dos_creditos); tranca = true; audio_play_sound(select,100,false)} break;
	case 2:	if (keyboard_check_pressed(vk_enter)) {game_end()} break;
}

//Travar opções selecionada
sel = clamp(sel,0,_qnt-1)

//(sel)
