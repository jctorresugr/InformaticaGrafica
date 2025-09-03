extends Node3D
@export var cambio := 0.02 
@export var escalar = 0.4
var flag=0

func _ready():
	translate(Vector3(-1.5,-escalar/2.0-0.1, 0.0))
	_process(cambio)

func _process(cambio):
	if Input.is_action_pressed("bajar_cable"):
		escalar += cambio
		if escalar>4.3: escalar=4.3
	elif Input.is_action_pressed("subir_cable"):
		escalar -= cambio
		if escalar<0.1: escalar=0.1
	"if flag==0: 
		escalar += cambio
		if escalar>4.27:
			escalar=4.27
			flag=1  
	elif flag==1:
		escalar -= cambio
		if escalar<0.1:
			escalar=0.1
			flag=0"
	scale=Vector3(1.0, escalar, 1.0)
	
	"extends Node3D
	@export var activar := activar_cabeza
	var activa := true
	var angulo := 0.0
	func _process(delta):
		if Input.is_action_just_pressed(activar):
			activa = !activa
			if activa:
				rotation.y += deg_to_rad(rotation_speed_deg * delta)"
