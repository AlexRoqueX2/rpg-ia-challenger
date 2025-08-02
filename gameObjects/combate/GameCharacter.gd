extends Node

class_name GameCharacter

var full_name: String
var hp: int
var max_hp: int
var velocity: int
var actions: Array[PlayerAction]

func _init(full_name: String, hp: int, velocity: int, actions: Array[PlayerAction]):
	self.full_name = full_name
	self.max_hp = hp
	self.hp = hp
	self.velocity = velocity
	self.actions = actions

func esta_vivo() -> bool:
	return hp > 0
	
