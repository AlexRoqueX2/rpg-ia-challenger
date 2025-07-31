extends Node2D

@onready var turn_manager = $GerenciadorCombate
@onready var caixa_de_texto = $UICombate/CaixaDeTexto
@onready var botoes_acoes = $UICombate/BotoesAcoes
@onready var ui = $MenuCombate

var Personagem = preload("res://gameObjects/combate/Personagem.gd")

func _ready():
	
	# Cria heróis e inimigos
	var heroi1 = Personagem.new("Guerreiro", 100, 20, true)
	ui.atualizarHp(heroi1.max_hp)
	var heroi2 = Personagem.new("Mago", 70, 25, true)
	var inimigo1 = Personagem.new("Goblin", 50, 15, false)
	var inimigo2 = Personagem.new("Orc", 80, 10, false)

	turn_manager.personagens = [heroi1, heroi2, inimigo1, inimigo2]
	turn_manager.iniciar_turno()
