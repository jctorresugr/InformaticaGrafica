extends Camera3D
@export var zoom_speed := 2.0
@export var rotate_speed := 0.01
var rot_x := 0.0
var rot_y := 0.0
@onready var ray = $Rayo

func _process(_delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var from = project_ray_origin(mouse_pos)
	var to = from + project_ray_normal(mouse_pos) * 1000.0
	ray.global_position = from
	ray.look_at(to)
	ray.target_position = Vector3(0, 0, -1000) # Siempre apunta en su -Z local
	ray.force_raycast_update()
	
func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if ray.is_colliding():
			var objeto = ray.get_collider()
			print("Seleccionado:", objeto.name)
			print("Punto de impacto:", ray.get_collision_point())
	
