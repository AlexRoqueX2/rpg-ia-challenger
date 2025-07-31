extends Node

class_name Personagem

var nome : String

var hp : int
var max_hp : int
var velocidade : int

var turno_finalizado : bool = false
var liderado : bool = true
var protagonista : bool = true

func _init(_nome: String, _hp: int, _velocidade: int, liderado := true, protagonista := true):
	nome = _nome
	max_hp = _hp
	hp = _hp
	velocidade = _velocidade
	liderado = liderado
# personagens liderados so estão no lado esquerdo do campo 
	protagonista = protagonista

func resetar_turno():
	turno_finalizado = false

func finalizar_turno():
	turno_finalizado = true

func esta_vivo() -> bool:
	return hp > 0
