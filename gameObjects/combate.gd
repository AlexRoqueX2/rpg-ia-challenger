extends Node2D

var GameCharacter = preload("res://gameObjects/combate/GameCharacter.gd")
var PlayerAction = preload("res://gameObjects/combate/PlayerAction.gd")
var MatchManager = preload("res://gameObjects/combate/MatchManager.gd")

@onready var combat_menu: CombatMenu = $CombatMenu

func _ready():
	print("=====")
	var action = PlayerAction.new("Dano", 10, "dano", 50, 1)
	var	character = GameCharacter.new("Allan Roque", 50, 50, [action, action, action])
	
	var match = MatchManager.new(character, [character], [character], combat_menu)
	add_child(match)
