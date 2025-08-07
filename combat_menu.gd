extends Control

class_name CombatMenu

signal action_selected(action: PlayerAction)

@onready var character_name = $PanelContainer/CharacterGrid/CharacterName
@onready var hp_bar = $PanelContainer/CharacterGrid/HpBar
@onready var hp_bar_label = $PanelContainer/CharacterGrid/HpBar/Label

@onready var menu_grid = $MenuGrid
@onready var fight_button = $MenuGrid/FightButton
@onready var run_button = $MenuGrid/RunButton

@onready var fight_grid = $FightGrid
@onready var button1 = $FightGrid/ActionButton1
@onready var button2 = $FightGrid/ActionButton2
@onready var button3 = $FightGrid/ActionButton3
@onready var button4 = $FightGrid/ActionButton4

var character: GameCharacter	

func setup(character: GameCharacter):
	self.character = character
	fight_button.pressed.connect(_on_fight_button_pressed)
	setCharacterName()
	setFightActions()
	refresh_hp()
	
	if !character.is_alive():
		fight_button.disabled = true

func setCharacterName():
	character_name.text = character.full_name

func setFightActions():
	button1.text = character.actions[0].actionName
	button2.text = character.actions[1].actionName
	button3.text = character.actions[2].actionName
	
	button1.pressed.connect(func(): 
		emit_signal("action_selected", character.actions[0])
		_on_fight_back_button_pressed()
	)
	button2.pressed.connect(func(): 
		emit_signal("action_selected", character.actions[1])
		_on_fight_back_button_pressed()
	)
	button3.pressed.connect(func(): 
		emit_signal("action_selected", character.actions[2])
		_on_fight_back_button_pressed()
	)

	button4.pressed.connect(_on_fight_back_button_pressed)

func refresh_hp():
	hp_bar.max_value = character.max_hp
	hp_bar.value = character.hp
	hp_bar_label.text = "%d / %d" % [character.hp, character.max_hp]
	
func _on_fight_button_pressed():
	menu_grid.visible = false
	fight_grid.visible = true
	
func _on_fight_back_button_pressed():
	fight_grid.visible = false
	menu_grid.visible = true
