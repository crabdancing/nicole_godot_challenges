extends RigidBody2D

func _ready():
	$CollisionPolygon2D.polygon = $Polygon2D.polygon
