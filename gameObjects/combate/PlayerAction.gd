extends Node

class_name PlayerAction

var actionName: String
var damage: int
var description: String
var maxUsage: int
var currentUsage: int

func _init(actionName: String, damage: int, description: String, maxUsage: int, currentUsage: int):
	self.actionName = actionName
	self.damage = damage
	self.description = description
	self.maxUsage = maxUsage
	self.currentUsage = currentUsage
