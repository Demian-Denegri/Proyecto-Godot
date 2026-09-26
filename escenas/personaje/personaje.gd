extends CharacterBody2D

@export var animacion: AnimatedSprite2D
var _velocidad: float = 150.0
var ultima_direccion = "abajo"


func _physics_process(delta):
	obtener_direccion()
	move_and_slide()

func obtener_direccion():
	var direccion = Input.get_vector("izquierda", "derecha", "arriba", "abajo") #obtengo la tecla perionada y su vector.
	if direccion == Vector2.ZERO: #Vector2.ZERO es el origiend e los vectores, 0.0;
		#si estoy sin apretar ninguna tecla se coloca el vector en 0;
		velocity = Vector2.ZERO
		animacion.play("idle")
		return

	if abs(direccion.x) > abs(direccion.y): #abs es absolute, transforma los negativos en positivos para comparar
		# Movimiento horizontal
		animacion.play("correr")
		animacion.flip_h = direccion.x < 0  # da vuelta la animacion
		if direccion.x > 0:
			ultima_direccion = "derecha"
		else :
			ultima_direccion = "izquierda"
	else: #movimiento vertical
		if direccion.y > 0:
			animacion.play("correr_abajo")
			ultima_direccion = "abajo"
		else:
			animacion.play("subir")
			ultima_direccion = "arriba"

	velocity = direccion * _velocidad #calculo de velocidad
