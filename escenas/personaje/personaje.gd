extends CharacterBody2D

@export var animacion: Node
var _velocidad: float = 200.0



func _physics_process(delta):
	if Input.is_action_pressed("derecha"):
		velocity.x = _velocidad
		animacion.flip_h = true
		animacion.play("correr")
	elif Input.is_action_pressed("izquierda"):
		animacion.flip_h = false
		velocity.x = -_velocidad
		animacion.play("correr")
	elif Input.is_action_pressed("arriba"):
		velocity.y = -_velocidad
	elif Input.is_action_pressed("abajo"):
		velocity.y = _velocidad
	else:
		velocity.x = 0
		velocity.y = 0
		animacion.play("idle")
	move_and_slide()
