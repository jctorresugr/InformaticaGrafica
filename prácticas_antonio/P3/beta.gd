extends Node3D
@export var incremento := 0.1 # velocidad 
var transladar := 0.0  

func _ready():
	_process(incremento)
	
func _process(incremento):
	position=Vector3(-0.5, 0.0, 0.0)
	if Input.is_action_pressed("mover_izquierda"):
		transladar -= incremento
		if transladar<-1.2 : transladar=-1.2
	elif Input.is_action_pressed("mover_derecha"):
		transladar += incremento
		if transladar>2.2 : transladar=2.2

	translate(Vector3(transladar, 0, 0))
