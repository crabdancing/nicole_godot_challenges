extends RigidBody2D

onready var mouse_inside = false

func _ready():
	$CollisionPolygon2D.polygon = $Polygon2D.polygon


func _on_Platform_mouse_entered():
	mouse_inside = true

func _on_Platform_mouse_exited():
	mouse_inside = false
