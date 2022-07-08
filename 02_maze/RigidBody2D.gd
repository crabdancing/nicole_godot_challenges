tool
extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(Rect2) var rect setget set_rect
export(Vector2) var point

onready var polygon: PoolVector2Array

func set_rect(new_rect):
	rect = new_rect
	update_rect()
	
	
func update_rect():
	polygon = PoolVector2Array()
	polygon.append(rect.position)
	polygon.append(Vector2(rect.size.x, rect.position.y))
	polygon.append(rect.size)
	polygon.append(Vector2(rect.position.x, rect.size.y))
	if $CollisionPolygon2D:
		$CollisionPolygon2D.polygon = polygon
	if $Polygon2D:
		$Polygon2D.polygon = polygon
	
# Called when the node enters the scene tree for the first time.
func _ready():
	update_rect()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
