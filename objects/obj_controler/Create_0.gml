//Variaveis principais
/*
	Modo de jogo é a variavel que vai fazer o player transitar entre andar com o robo ou 
	selecionar o robo no jogo, o modo de jogo muda de 0 pra 1;
*/
global.modo_de_jogo = 0

//Verificar se estamos selecionando um player
global.player_select = false

//Vamos criar nossa grid
largura		= 20;	//Horizontal
altura		= 12;	//Vertical
tamanho_cel = 64;

numb = 0;
gay = false;

//tecla delay
delay_x1 = 0;
delay_y1 = 0;
delay_x2 = 0;
delay_y2 = 0;

//Vamos criar agora a grid
grid = array_create(largura)

//Agora vamos colocar as linhas Horizontais na grid, dentro da array de largura
for (var i = 0; i < largura; i++)
{
	grid[i] = array_create(altura)
}

//Seleção de grid
sel_x = 9;
sel_y = 2;

//Celula atual
celula_atual_x = 0
celula_atual_y = 0

global.ativadores = []

//Mudar
mudar = false

//Definir que todas as arrays tenham variaveis dentro
grid[0][0] =
{

}

//Desfazer bloco
alpha = .4
desfazer = false


//Função criar linhas
criar_linhas = function()
{
	//Criar linhas horizontais verticalmente
	for (var i = 0; i < altura + 1; i++)
	{
		//Desenhar Linha
		draw_line(0,i * tamanho_cel,room_width,i * tamanho_cel)
	}

	//Desenhar linha verticais horizontalmente
	for (var u = 0; u < largura + 1; u++)
	{		
		//Desenhar linha
		draw_line(u * tamanho_cel,0,u * tamanho_cel,room_height)
	}
}

//Função criar numeros nas linhasn
numero_linhas = function()
{
	//Desenhar numero em cada linha	
	for (var i = 0; i < largura; i++)
	{		
		//Desenhar mais numeros em outras linhas
		for (var u = 0; u < altura; u++)
		{
			//Editar numb
			numb = u * largura + i
			
			//Desenhar numero
			draw_text(i * tamanho_cel,u * tamanho_cel,numb)
		}
	}
}

//Enviar pra nosso global
global.grid = grid;


//Level atual
global.level_atual = noone;

//Proxima room
global.proxima_room = noone;

//Modo tutorial
global.modo_tutorial = false;
global.modo_tutorial_completo = false;
modo_tutorial_dica = 0;
modo_tutorial_alpha = 1;
modo_tutorial_dica_feito = false;

entrar = false

//Dica de reniciar
global.dica_reiniciar = false;
dica_alpha = .4;
_xscale = 1;
_yscale = 1;
contage_reinicio = 0;
reinicio_delay = 110; //So vai poder reiniciar depois que acabar isso 
reinicio_pause = true; //Não vai poder reniciar durante a transição pra passar de level

//Configurar status de todos os leveis
global.leveis = 
{
	tutorial :
	{
		completo : false
	}
}

