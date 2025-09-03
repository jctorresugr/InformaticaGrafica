extends Node3D
@export var escalar := 0.25
@export var cambio := 0.02

func _ready():
	_process(cambio)
	
func _process(cambio):
	position=Vector3(-1.5, -0.25, 0.0)
	if Input.is_action_pressed("bajar_cable"):
		escalar +=cambio
		if escalar>4.3: escalar=4.3
	
	elif Input.is_action_pressed("subir_cable"):
		escalar -= cambio
		if escalar<0.1: escalar=0.1
	translate(Vector3(0,-escalar, 0))
	
