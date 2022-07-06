extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var colShape = $Area2D/CollisionShape
onready var shape = Shape2D::CircleShape2D(20)
onready var color = Color(0, 0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _draw():
	shape.draw()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()
