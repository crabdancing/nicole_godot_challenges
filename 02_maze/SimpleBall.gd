tool # tool is useful to see real time results of logic
extends KinematicBody2D


export var radius = 10 setget set_radius
export(Color) var color = Color(100, 100, 100)  setget set_color

export var speed = 100
var screen_size 
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
	$VisibilityNotifier2D.position = position - transform.get_origin() - Vector2(
		-radius * scale_visibility_notifier,
		-radius * scale_visibility_notifier)
	$CollisionShape2D.shape.radius = radius
	
func _ready():
	screen_size = get_viewport_rect().size
	$CollisionShape2D.shape = CircleShape2D.new()
	recalculate_radius()
	update()
	
func _draw():
	draw_circle(position - transform.get_origin(), radius, color)


func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	velocity =  move_and_slide(velocity, Vector2.DOWN)
	if position != null:
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
