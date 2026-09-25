extends CharacterBody2D

@export var animacion: Node
@export var reproductor: AudioStreamPlayer2D
var _velocidad: float = 150.0



func _physics_process(delta):
	if Input.is_action_pressed("derecha"):
		velocity.x = _velocidad
		animacion.flip_h = false
		animacion.play("correr")
	elif Input.is_action_pressed("saltar"):
		animacion.play("pegar_eje_Y")
	elif Input.is_action_pressed("izquierda"):
		animacion.flip_h = true
		velocity.x = -_velocidad
		animacion.play("correr")
	elif Input.is_action_pressed("arriba"):
		animacion.play("subir");
		velocity.y = -_velocidad
	elif Input.is_action_pressed("abajo"):
		animacion.play("correr_abajo");
		velocity.y = _velocidad
	else:
		velocity.x = 0
		velocity.y = 0
		animacion.play("idle")
	move_and_slide()
