extends Node2D

class_name Battlefield

@onready var allies = [$Ally1, $Ally2, $Ally3, $Ally4]
@onready var alliesHp = [$Ally1/hp, $Ally2/hp, $Ally3/hp, $Ally4/hp]
@onready var enemies = [$Enemy1, $Enemy2, $Enemy3, $Enemy4]
@onready var enemiesHp = [$Enemy1/hp, $Enemy2/hp, $Enemy3/hp, $Enemy4/hp]

var currentEnemySelected

func set_players(allies: Array[GameCharacter], enemies: Array[GameCharacter]):
	currentEnemySelected = enemies[0]

	for i in range(allies.size()):
		self.allies[i].visible = false
		self.alliesHp[i].text = ""

		if allies[i].is_alive():
			self.allies[i].visible = true
			self.alliesHp[i].text = str(allies[i].hp) + " / " + str(allies[i].max_hp)

	for i in range(enemies.size()):
		self.enemies[i].visible = false
		self.enemiesHp[i].text = ""

		if enemies[i].is_alive():
			self.enemies[i].visible = true
			self.enemiesHp[i].text = str(enemies[i].hp) + " / " + str(enemies[i].max_hp)
			self.enemies[i].connect("input_event", Callable(self, "_on_enemy_pressed").bind(enemies[i]))

func _on_enemy_pressed(viewport, event, shape_idx, enemy: GameCharacter):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		currentEnemySelected = enemy
