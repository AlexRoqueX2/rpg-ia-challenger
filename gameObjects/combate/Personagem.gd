extends Node

class_name Personagem

var full_name: String

var hp: int
var max_hp: int
var velocity: int

#class Action {
	#name: "Bater",
	#damage: 5,
#}

#var actions: Array[Action]

func _init(full_name: String, hp: int, velocity: int):
	self.full_name = full_name
	self.max_hp = hp
	self.hp = hp
	self.velocity = velocity

func esta_vivo() -> bool:
	return hp > 0
	
