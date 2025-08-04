extends PanelContainer

class_name Battlefield

@onready var allies = [$Ally1, $Ally2, $Ally3, $Ally4]
@onready var enemies = [$Enemy1, $Enemy2, $Enemy3, $Enemy4]

func setPlayers(allies: Array[GameCharacter], enemies: Array[GameCharacter]):
	for i in range(allies.size()):
		self.allies[i].visible = true

	for i in range(enemies.size()):
		self.enemies[i].visible = true
