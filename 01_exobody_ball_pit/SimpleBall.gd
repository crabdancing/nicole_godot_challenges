tool # tool is useful to see real time results of logic
extends RigidBody2D


export var radius = 10 setget set_radius
export(Color) var color = Color(100, 100, 100)  setget set_color

var diameter = radius * 2

func set_radius(new_radius):
	radius = new_radius
	recalculate_radius()
	update()
	
	
func set_color(new_color):
	color = new_color
	update()
	
func recalculate_radius():
	diameter = radius * 2
	var scale_visibility_notifier = 4
	$VisibilityNotifier2D.rect = Rect2(-diameter * scale_visibility_notifier,
		-diameter * scale_visibility_notifier,
		diameter * scale_visibility_notifier,
		diameter * scale_visibility_notifier)
	$VisibilityNotifier2D.position = position - Vector2(
		-radius * scale_visibility_notifier,
		-radius * scale_visibility_notifier)
	$CollisionShape2D.shape.radius = radius
	
func _ready():
	$CollisionShape2D.shape = CircleShape2D.new()
	recalculate_radius()
	update()
	
func _draw():
	draw_circle(position - transform.get_origin(), radius, color)

# We are no longer in sight
func _on_VisibilityNotifier2D_viewport_exited(_viewport):
	# Instantly kill self Y~Y
	queue_free()
