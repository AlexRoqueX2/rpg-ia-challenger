extends Control

@onready var hp_bar : TextureProgressBar = $CanvasLayer/VBoxContainer/HBoxContainer/TextureProgressBar
@onready var dialogue_box : RichTextLabel = $CanvasLayer/VBoxContainer/RichTextLabel
@onready var atk_button : Button = $CanvasLayer/VBoxContainer/HBoxContainer2/atk
@onready var atc_button : Button  = $CanvasLayer/VBoxContainer/HBoxContainer2/atc
@onready var iten_button : Button  = $CanvasLayer/VBoxContainer/HBoxContainer2/iten
@onready var run_button : Button  = $CanvasLayer/VBoxContainer/HBoxContainer2/run

func _ready():
	show_dialogue("Você encontrou um inimigo!")
	toggle_buttons(true)
	
	atk_button.pressed.connect(atacar)
	atc_button.pressed.connect(agir)
	iten_button.pressed.connect(iten)
	run_button.pressed.connect(run)

func atualizarHp(current_hp: int):
	hp_bar.value = current_hp

func show_dialogue(text: String):
	dialogue_box.text = text

func toggle_buttons(visible: bool):
	atk_button.visible = visible
	atc_button.visible = visible
	iten_button.visible = visible
	run_button.visible = visible
	

func atacar() -> void:
	print("atacou")
func agir() -> void:
	print("agiu")
func iten() -> void:
	print("iten")
func run() -> void:
	print("coreu")
