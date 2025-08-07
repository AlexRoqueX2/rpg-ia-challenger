extends Node

class_name GameCharacter

var id: int
var full_name: String
var hp: int
var max_hp: int
var velocity: int
var actions: Array[PlayerAction]

func _init(id: int, full_name: String, hp: int, velocity: int, actions: Array[PlayerAction]):
	self.id = id
	self.full_name = full_name
	self.max_hp = hp
	self.hp = hp
	self.velocity = velocity
	self.actions = actions

func receive_damage(damage: int):
	self.hp -= damage

func is_alive() -> bool:
	return hp > 0
	
