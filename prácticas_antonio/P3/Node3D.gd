extends Node3D
@export var altura := 1.5
@export var lado := 1.0


# Called when the node enters the scene tree for the first time.
func _ready():
	var mesh := ArrayMesh.new()
	var st := SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	var h = altura/2.0
	var l = lado / 2.0
	# Vértices
	var v = [
	Vector3(-l, 0, -l), # v0 base
	Vector3( l, 0, -l), # v1 base
	Vector3( l, 0, l), # v2 base
	Vector3(-l, 0, l), # v3 base
	Vector3( 0, h, 0) # v4 cima
	]
	# Caras como listas de índices
	var caras = [
	[0, 1, 4], # cara lateral 1
	[1, 2, 4], # cara lateral 2
	[2, 3, 4], # cara lateral 3
	[3, 0, 4], # cara lateral 4
	[2, 0, 3], # base 1
	[1, 0, 2] # base 2
	]
	
	var Utils = load("res://funciones.gd")
	var normales_caras: Array[Vector3] = []
	for cara in caras:
		normales_caras.append(Utils.calcular_normal( v[cara[0]], v[cara[1]], v[cara[2]]))
	print(normales_caras)

	
	# Paso 3: construir malla
	var i:=0
	for cara in caras:
		st.set_normal(normales_caras[i])
		i=i+1
		for idx in cara:
			st.add_vertex(v[idx])
			
	st.generate_normals()
	st.commit(mesh)
	# Crear el MeshInstance3D y asignar el material
	var m = MeshInstance3D.new()
	var material=StandardMaterial3D.new()
	m.mesh = mesh
	material.albedo_color = Color(1.0, 0.1, 0.2) # Naranja claro
	m.material_override = material
	add_child(m)
