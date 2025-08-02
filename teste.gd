extends Node

var Personagem = preload("res://gameObjects/combate/Personagem.gd")
var MatchManager = preload("res://gameObjects/combate/MatchManager.gd")

func _init() -> void:
	var player = Personagem.new("Alex", 100, 100)
	
	var ally1 = Personagem.new("Luna", 80, 50)
	var ally2 = Personagem.new("Kai", 70, 60)
	var allies: Array[Personagem] = [ally1, ally2]
	
	var enemy1 = Personagem.new("Goblin", 50, 70)
	var enemy2 = Personagem.new("Orc", 120, 30)
	var enemies: Array[Personagem] = [enemy1, enemy2]
	
	# Criando partida e passando os personagens
	var match = MatchManager.new(player, allies, enemies)
	add_child(match)
