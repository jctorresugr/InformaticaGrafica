extends Node3D
@export var incremento := 0.2 # velocidad angular en rad/s
var angulo := 0.0

func _ready():
	_process(incremento)

func _process(incremento):
	rotation=Vector3(0.0, 0.0, 0.0)
	position=Vector3(-1,5.1,0.0)
	if Input.is_action_pressed("girar_izquierda"):
		angulo -= incremento
		if angulo<-PI/2.0 : angulo=-PI/2.0
	elif Input.is_action_pressed("girar_derecha"):
		angulo += incremento
		if angulo>PI/2.0 : angulo=PI/2.0
	translate(Vector3(1, 0, 0))
	rotate_y(angulo)
	translate(Vector3(-1, 0, 0))
