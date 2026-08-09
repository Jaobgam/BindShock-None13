opcoes = ["Jogar","Creditos","Sair"]
sel = 0;

shake[0] = ["[]","[]"]
shake[1] = ["[wheel][cycle,120,240,58,177]","[/wheel][/cycle]"]

sel_s = 0

tranca = false;

alpha = 1

//Escala 
escala = [1,1,1]

global.obrigado_joga = true

//Fonte Scribble
if !scribble_font_exists("fnt_monogram_48_4")
{
	font = scribble_font_bake_outline_8dir_2px("fnt_monogram_48","fnt_monogram_48_4",c_black,0)
}
else
{
	font = "fnt_monogram_48_4"
}

scribble_font_set_default("fnt_monogram_48_4")

//scribble_font_set_default(global.keepAssets[2])