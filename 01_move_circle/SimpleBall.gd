tool
extends RigidBody2D


export var radius = 10
var old_radius = radius
export(Color) var color = Color(100, 100, 100) 
var old_color = color
# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.shape = CircleShape2D.new()
	$CollisionShape2D.shape.radius = radius
	$VisibilityNotifier2D.rect = Rect2(-radius, -radius, radius, radius)
	update()

func _draw():
	draw_circle(position - transform.get_origin(), radius, color)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if old_radius != radius or old_color != color:
		update()
