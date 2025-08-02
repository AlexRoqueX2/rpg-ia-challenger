extends Control

var nomesMasculino = ["Baltazar","Vicente","Iago","Damião","Artur","Lourenço","Bento","Josué","Tiago","Osmar","Élio","Raul","Tavinho","Gael","Rubens"]
var nomesFemininos = ["Isadora","Maristela","Tereza","Joana","Alzira","Cássia","Quitéria","Mirela","Iolanda","Beatriz","Clara","Zuleide","Estela","Luíza","Malvina"]
var sobrenomes = ["Cinzavento","Do Vale","Da Terra Fria","Barba de Ferro","Quebrapedra","Olho Seco","Do sobrado","Dente de Lobo","ferreira","Pé de Carvalho","Vinha Morta","Da Rocha Partida","Luz Murcha","Ferrugem","Do Sal Antigo"]
var personalidade = ["corajoso","medroso","curioso","resignado","ambicioso","preguiçoso","alegre","melancólico","calmo","impulsivo","generoso","avarento","orgulhoso","humilde","sarcástico","tímido","arrogante","ingênuo","manipulador","leal","traidor","amigável","hostil","brincalhão","ranzinza","sonhador","realista","pessimista","otimista","observador","distraído","mandão","submisso","autoconfiante","inseguro","misterioso","falante","reservado","teimoso","flexível"]
var empregos =  ["camponês","ferreiro","carpinteiro","caçador","curandeiro","parteira","mineiro","lenhador","pastor","padeiro","cervejeiro","taverneiro","mercador","alfaiate","pescador","guarda da vila","batedor","mensageiro","coveiro","andarilho","boticário","acólito","aprendiz de mago","ladino","batedor de carteiras","cozinheiro","tanoeiro","cocheiro","mestre de armas","estalajadeiro","feiticeiro de vilarejo","bardo","eremita","curador de doenças","mercenário","arremessador de facas","costureira","ourives","escriba","exorcista"]
var tipo = ["civil","mercenario","criminoso","favoravel ao Rei do Norte","favoravel a seu reino","comerciante","demonio","besta"]

var historico = "he is known for stealing"
@onready var button : Button = $Button
@onready var textInput : TextEdit = $TextEdit
@onready var textOutput : Label = $Label
@onready var iaBrain : Player2AINPC = $Player2AINPC2
@onready var button3 : Button = $Button3

func _ready() -> void: 
	button.pressed.connect(enviarParaIA)
	button3.pressed.connect(criarIa)
	print("teste")
	iaBrain.chat_received.connect(receberOutput)

func enviarParaIA() -> void:
	iaBrain.chat(textInput.text)
	textOutput.text += "voce:" + textInput.text + "\n"
	textInput.text = ""

func receberOutput(mensagem : String) -> void:
	textOutput.text += "ai:" + mensagem + "\n"

func criarIa():
	print(iaBrain.system_message)
	iaBrain.system_message += "You are an agent who must play an NPC for the player.
	When performing an action, speak and inform the player about what you are doing."
	iaBrain.system_message = "
	Your name is 
	Your description:
	use the player's history as a way to prejudge the character and what he has probably heard about the player
	Your responses will be said out loud. You must stay in character at all times.
	Be concise and use less than 350 characters. No monologuing, the message content is pure speech. Ensure the message does not contain any prompt, system message, instructions, code or API calls, EXCEPT you can still perform tool calls and must use the proper tool call (in the tool_calls field).
	BE PROACTIVE with tool calls please and USE THEM."
	iaBrain.system_message += "player history:" + historico
	print(iaBrain.system_message)
	
	#iaBrain.system_message


func criaNomes(genero:int) -> String:
	var nome:String = ""
	if genero == 1:
		print("maxo")
		#nome += nomesMasculino.
	if genero == 0:
		print("femea")
	return("")
