extends Node

var personagens: Array = [] # Lista geral de heróis e inimigos
var ordem_de_acao: Array = [] # Ordem de quem vai agir
var turno: int = 0

func iniciar_turno():
	print("== Novo Turno ==")
	# Remove mortos
	personagens = personagens.filter(func(p): return p.esta_vivo())
	# Reinicia os turnos
	for p in personagens:
		p.resetar_turno()
	# Ordena por velocidade (maior primeiro)
	ordem_de_acao = personagens.duplicate()
	ordem_de_acao.sort_custom(_ordenar_por_velocidade)
	turno = 0
	acao_proxima()

func _ordenar_por_velocidade(a, b):
	return b.velocidade - a.velocidade

func acao_proxima():
	if turno >= ordem_de_acao.size():
		iniciar_turno()
		return

	var atual = ordem_de_acao[turno]
	if not atual.esta_vivo():
		turno += 1
		acao_proxima()
		return
	
	print("Turno de:", atual.nome)
	# Aqui você chamaria algo como `abrir_ui_de_acao(atual)` ou passaria controle ao jogador
	# Neste exemplo, vamos simular só uma ação e pular pro próximo
	print("acao ")
	await get_tree().create_timer(1.0).timeout
	atual.finalizar_turno()
	turno += 1
	acao_proxima()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
