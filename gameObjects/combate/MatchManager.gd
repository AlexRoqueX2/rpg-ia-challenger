extends Node

class_name MatchManager

var player: GameCharacter
var allies: Array[GameCharacter] = []
var enemies: Array[GameCharacter] = []

var battlefield: Battlefield
var combat_menu: CombatMenu
var ordem_do_turno: Array = []
var round: int = 0

func _init(player: GameCharacter, allies: Array[GameCharacter], enemies: Array[GameCharacter], battlefield: Battlefield, combat_menu: CombatMenu):
	self.player = player
	
	self.allies.append(player)
	self.allies.append(allies[0])
	self.allies.append(allies[1])
	self.allies.append(allies[2])
	
	self.enemies = enemies
	self.combat_menu = combat_menu
	self.battlefield = battlefield

func _ready():
	print("== Start Game ==")
	
	battlefield.set_players(allies, enemies)
	
	combat_menu.action_selected.connect(_on_action_selected)
	combat_menu.setup(player)

func _on_action_selected(action: PlayerAction):
	var players = allies + enemies
	players.sort_custom(func(a, b): return a.velocity > b.velocity)
	
	for player in players:
		if self.player == player and player.is_alive():
			get_character_by_id(players, battlefield.currentEnemySelected.id).receive_damage(action.damage)

		var randomEnemy = players[randi() % players.size()].id
		var randomDamage = player.actions[randi() % player.actions.size()].damage
		get_character_by_id(players, randomEnemy).receive_damage(randomDamage)

	battlefield.set_players(allies, enemies)

	if is_end_game():
		print("== Game Over ==")

	combat_menu.setup(player)

func is_end_game() -> bool:
	var isAlliesDead = true
	var isEnemiesDead = true
	var isPlayerDead = true

	for enemy in enemies:
		if enemy.is_alive():
			isEnemiesDead = false

	for ally in allies:
		if ally.is_alive():
			isAlliesDead = false

	if player.is_alive():
		isPlayerDead = false

	return isAlliesDead or isEnemiesDead or isPlayerDead


func get_character_by_id(characters: Array[GameCharacter], id: int) -> GameCharacter:
	for character in characters:
		if character.id == id:
			return character
	return null

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
