# Arquivo: MatchManager.gd
extends Node

var Personagem = preload("res://gameObjects/combate/Personagem.gd")

var player: Personagem
var allies: Array[Personagem] = []
var enemies: Array[Personagem] = []

var ordem_do_turno: Array = []
var round: int = 0

func _init(player: Personagem, allies: Array[Personagem], enemies: Array[Personagem]):
#	instanciar tela de acao do jogador
	self.player = player
	self.allies = allies
	self.allies.append(player)
	self.enemies = enemies

func _ready():
	print("== Start Game ==")
	
	new_round();

func new_round():
	round += 1
	
	var turns = allies + enemies
	turns.sort_custom(func(a, b): return a.velocity > b.velocity)
	
	for turn in turns:
		print("== Person ==")
		print(turn.full_name)
		
		if turn == player:
			print("receba a acao")
			
			var players = turns
#			Filtrar para remover o jogador atual
			players.filter(func(a): return a != turn)
#			set: players
#			set: actions na tela
#			Exibir tela
			return
		
#		pergunta ao chat a acao

# onbtnpress
# executar a acao
# if end game?
# show end game
# else new round

func is_end_game() -> bool:
	return !allies.is_empty() || !enemies.is_empty()

# adi

#func iniciar_turno():
	#print("== Novo Turno ==")
#
	#personagens = personagens.filter(func(p): return p.esta_vivo())
#
	## Ordena por velocidade (maior primeiro)
	#ordem_do_turno = personagens.duplicate()
	#ordem_do_turno.sort_custom(_ordenar_por_velocidade)
	#turno = 0
	#acao_proxima()
#
#func _ordenar_por_velocidade(a, b):
	#return b.velocidade - a.velocidade
#
#func acao_proxima():
	#if turno >= ordem_do_turno.size():
		#iniciar_turno()
		#return
#
	#var atual = ordem_do_turno[turno]
	#if not atual.esta_vivo():
		#turno += 1
		#acao_proxima()
		#return
	#
	#print("Turno de:", atual.nome)
	## Aqui você chamaria algo como `abrir_ui_de_acao(atual)` ou passaria controle ao jogador
	## Neste exemplo, vamos simular só uma ação e pular pro próximo
	#print("acao ")
	#await get_tree().create_timer(1.0).timeout
	#atual.finalizar_turno()
	#turno += 1
	#acao_proxima()
