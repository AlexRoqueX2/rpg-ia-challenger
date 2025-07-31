extends Control
@onready var button : Button = $Button
@onready var textInput : TextEdit = $TextEdit
@onready var textOutput : Label = $Label
@onready var iaBrain : Player2AINPC = $Player2AINPC2

func _ready() -> void: 
	button.pressed.connect(enviarParaIA)
	print("teste")
	iaBrain.chat_received.connect(receberOutput)


func enviarParaIA() -> void:
	iaBrain.chat(textInput.text)
	textOutput.text += "voce:" + textInput.text + "\n"
	textInput.text = ""

func receberOutput(mensagem : String) -> void:
	textOutput.text += "ai:" + mensagem + "\n"
