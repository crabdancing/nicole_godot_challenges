extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var color = Color(255, 0, 0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var gravity = 9.8/4
onready var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2.UP)
	
func _draw():
	var circle: CircleShape2D = $CollisionShape2D.shape
	draw_circle(position, circle.radius, color)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
