extends Node3D
@export var incremento := 0.05 # velocidad angular en rad/s
var angulo := 0.0
var angulo2 := 0.0

func _ready():
	var delta:=0.0
	_process(delta)

func _process(delta):
	rotation=(Vector3(0, 0,0))
	if Input.is_action_pressed("orbitar_izquierda"):
		angulo -= incremento 
	elif Input.is_action_pressed("orbitar_derecha"):
		angulo += incremento

	if Input.is_action_pressed("orbitar_abajo"):
		angulo2 -= incremento
	elif Input.is_action_pressed("orbitar_arriba"):
		angulo2 += incremento
	
	rotate_y(angulo)
	rotate_x(angulo2)
	
	
	
