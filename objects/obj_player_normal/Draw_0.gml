draw_sprite(sprite_index,image_index,x,y)

/*
draw_set_alpha(.3)
draw_set_colour(c_maroon)

//Check da esquerda
draw_rectangle(x,y,x - 20,y + sprite_height,false)
//Check da direita
draw_rectangle(x + sprite_width,y,x + sprite_height + 20,y + sprite_height,false)
//Check de cima
draw_rectangle(x,y,x + sprite_width,y - 20, false)
//Check de baixo
draw_rectangle(x,y + sprite_height,x + sprite_width,y + sprite_height + 20, false)

draw_set_alpha(1)
draw_set_colour(c_white)