extends CharacterBody2D

const SPEED = 300.0
var interativo: Node = null  # Armazena o objeto que pode ser interagido

func _ready():
	$areaInterativa.connect("area_entered", Callable(self, "_on_area_entered"))
	$areaInterativa.connect("area_exited", Callable(self, "_on_area_exited"))
	
func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO
	
# Input de movimento: WASD e setas
	if Input.is_action_pressed("ui_direita"):
		direction.x += 1
	if Input.is_action_pressed("ui_esquerda"):
		direction.x -= 1
	if Input.is_action_pressed("ui_baixo"):
		direction.y += 1
	if Input.is_action_pressed("ui_cima"):
		direction.y -= 1

# Normaliza para não mover mais rápido na diagonal
	if direction != Vector2.ZERO:
		direction = direction.normalized()

# Aplica o movimento
	velocity = direction * SPEED
	move_and_slide()

	if Input.is_action_just_pressed("ui_action_positive") and interativo != null:
		print("tentou interagir")
		interativo.interact()

func _on_area_entered(area):
	print("funcao1")
	if area.get_parent().has_method("interact"):
		interativo = area.get_parent()

func _on_area_exited(area):
	print("funcao2")
	if interativo == area.get_parent():
		interativo = null
