extends MeshInstance3D
var color_albedo
@export var cambio=0

func _ready() -> void:
	var material = get_active_material(0)
	color_albedo = material.albedo_color
