tool # tool is useful to see real time results of logic
extends RigidBody2D


export var radius = 10 setget set_radius
export(Color) var color = Color(100, 100, 100)  setget set_color

var diameter = radius * 2

func set_radius(new_radius):
	radius = new_radius
	diameter = radius * 2
	$VisibilityNotifier2D.rect = Rect2(-diameter * 2, -diameter * 2, diameter * 2, diameter * 2)
	$VisibilityNotifier2D.position = position - Vector2(-diameter, -diameter)
	$CollisionShape2D.shape.radius = radius
	update()

func set_color(new_color):
	color = new_color
	update()
	
func _ready():
	diameter = radius * 2
	$VisibilityNotifier2D.rect = Rect2(-diameter * 2, -diameter * 2, diameter * 2, diameter * 2)
	$VisibilityNotifier2D.position = position - Vector2(-diameter, -diameter)
	$CollisionShape2D.shape = CircleShape2D.new()
	$CollisionShape2D.shape.radius = radius
	update()
	
func _draw():
	draw_circle(position - transform.get_origin(), radius, color)

# We are no longer in sight
func _on_VisibilityNotifier2D_viewport_exited(_viewport):
	# Instantly kill self Y~Y
	queue_free()
