extends Node3D
@onready var cubo = $Cubo
@export var velocidad := 30.0
func _ready():
  print("Escena lista. Posicion inicial:", cubo.global_position)

func _process(delta):
  cubo.rotate_y(deg_to_rad(velocidad * delta))
