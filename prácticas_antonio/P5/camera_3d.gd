extends Camera3D
@onready var ray = $Rayo
@export var zoom_speed := 0.2
@export var rotate_speed := 0.01
@export var umbral := 0.05
var rot_x := 0.0
var rot_y := 0.0
var pos:=position.z

func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var from = project_ray_origin(mouse_pos)
	var to = project_ray_normal(mouse_pos)*1000
	ray.global_position = from
	ray.target_position = ray.to_local(to)
	ray.force_raycast_update()
	
	
func _unhandled_input(event):
	if (event is InputEventMouseButton and 
	event.pressed and event.button_index == MOUSE_BUTTON_LEFT):
		if ray.is_colliding():
			var objeto = ray.get_collider()
			if objeto.name == "Suelo":
				var pos_cubo=ray.get_collision_point()
				crear_cubo_en(pos_cubo)
			else:
				#print("Seleccionado:", objeto.name)
				var objeto_p = objeto.get_parent()
				var material_p=objeto_p.get_active_material(0)
				if material_p is StandardMaterial3D:
					if objeto_p.get("cambio") != null:
						if objeto_p.cambio==0:
							material_p.albedo_color=Color(1.0,0.0,0.0)
							objeto_p.cambio=1
						else :
							material_p.albedo_color=objeto_p.color_albedo
							objeto_p.cambio=0
				print("Encontré la malla: ", objeto_p.name)
				print("Punto de impacto:", ray.get_collision_point())
	
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		rot_y -= event.relative.x * rotate_speed
		rot_x -= event.relative.y * rotate_speed
		rot_x = clamp(rot_x, -PI/2, PI/2)
		position=Vector3(0.0,0.0,0)
		rotation = Vector3(rot_x, rot_y, 0)
		translate(Vector3(0,0,pos))
		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			translate(Vector3(0, 0, -zoom_speed))
			pos-=zoom_speed
			if pos<umbral: pos=umbral
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			translate(Vector3(0, 0, zoom_speed))
			pos+=zoom_speed
			
func crear_cubo_en(pos: Vector3) -> void:
	var nuevo_cubo = MeshInstance3D.new()
	nuevo_cubo.mesh = BoxMesh.new()
	nuevo_cubo.position = pos + Vector3.UP * 0.5
	var mat = StandardMaterial3D.new()
	mat.albedo_color = Color(randf(), randf(), randf())
	nuevo_cubo.material_override = mat
	get_tree().get_current_scene().add_child(nuevo_cubo)
