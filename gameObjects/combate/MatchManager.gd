extends Node

class_name MatchManager

var player: GameCharacter
var allies: Array[GameCharacter] = []
var enemies: Array[GameCharacter] = []

var combat_menu: CombatMenu
var ordem_do_turno: Array = []
var round: int = 0

func _init(player: GameCharacter, allies: Array[GameCharacter], enemies: Array[GameCharacter], combat_menu: CombatMenu):
	self.player = player
	self.allies = allies
	self.allies.append(player)
	self.enemies = enemies
	self.combat_menu = combat_menu

func _ready():
	print("== Start Game ==")
	
	combat_menu.action_selected.connect(_on_action_selected)
	
	new_round();

func new_round():
	round += 1
	
	var players = allies + enemies
	players.sort_custom(func(a, b): return a.velocity > b.velocity)
	
	for player in players:
		if player == player:
			print("receba a acao")
			
#			Filtrar para remover o jogador atual
			players.filter(func(a): return a != player)
			combat_menu.setup(player)
			return
		
#		pergunta ao chat a acao

func _on_action_selected(action: PlayerAction):
	print(action.actionName)
	print(action.damage)

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
