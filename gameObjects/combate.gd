extends Node2D

var GameCharacter = preload("res://gameObjects/combate/GameCharacter.gd")
var PlayerAction = preload("res://gameObjects/combate/PlayerAction.gd")
var MatchManager = preload("res://gameObjects/combate/MatchManager.gd")

@onready var battlefield: Battlefield = $Background/Battlefield
@onready var combat_menu: CombatMenu = $CombatMenu

func _ready():
	var actions: Array[PlayerAction] = [
		PlayerAction.new("Dano 10", 10, "dano", 10, 0),
		PlayerAction.new("Dano 20", 20, "dano", 10, 0),
		PlayerAction.new("Dano 30", 30, "dano", 10, 0)
	];

	var	player = GameCharacter.new("Allan Roque", 100, 10, actions)

	var allies: Array[GameCharacter] = [
		GameCharacter.new("Aliado 1", 100, 6, actions),
		GameCharacter.new("Aliado 2", 100, 8, actions),
		#GameCharacter.new("Aliado 3", 100, 1, actions)
	]

	var enemies: Array[GameCharacter] = [
		GameCharacter.new("Inimigo 1", 100, 7, actions),
		GameCharacter.new("Inimigo 2", 100, 2, actions),
		GameCharacter.new("Inimigo 3", 100, 6, actions),
		GameCharacter.new("Inimigo 4", 100, 6, actions),
	]
	
	var match = MatchManager.new(player, allies, enemies, battlefield, combat_menu)
	add_child(match)
