draw_self();
//draw_sprite(sprite_index,image_index,x,y)

//Desenhar o cadeado se trancado
if (tranca_global)
{
	draw_sprite(spr_tranca,0,x+32,y+32)	
}

/*
draw_set_colour(c_olive)
draw_set_alpha(.4)
//Check da esquerda
draw_rectangle(x,y+5,x - 20,(y + sprite_height)-5,false)
Check da direita

//Check de cima/
draw_rectangle(x+5,y,(x + sprite_width)-5,y - 20, false)*/

//Check de baixo
//draw_rectangle(x + sprite_width,y+5,x + sprite_width + 20,(y + sprite_height)-5, false)
//draw_rectangle(x-20,y-10,x+sprite_width+20,y+sprite_height+10,false)
/*


draw_set_color(c_blue)

var i = 0
//draw_text(x,y + i,"ligado: " + string(ligado)) i += 10;
//draw_text(x,y + i,"em_move: " + string(em_move)) i += 10;
//draw_text(x,y + i,"player_move: " + string(player_move)) i += 10;
draw_text(x,y + i,"travado_left: " + string(travado_left)) i += 10;
draw_text(x,y + i,"travado_right: " + string(travado_right)) i += 10;
draw_text(x,y + i,"travado_up: " + string(travado_up)) i += 10;
draw_text(x,y + i,"travado_down: " + string(travado_down)) i += 10;


draw_set_colour(c_white)
draw_set_alpha(1)
