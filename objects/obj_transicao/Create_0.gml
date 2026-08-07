alpha = 0
iniciou = true
fechou = false;

//hhhhhhhhhhh
global.proxima_room = noone;
_seq_out = sq_transicao
_seq_in = sq_transicao_in


//Criar sequencia
layer_sequence_create("transicao",display_get_gui_width()/2,display_get_gui_height()/2,_seq_out)