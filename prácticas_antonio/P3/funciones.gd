extends Node3D

static func calcular_normal(p1: Vector3, p2: Vector3, p3: Vector3) -> Vector3:
	var normal =(p3-p1).cross(p2-p1).normalized()
	return normal
