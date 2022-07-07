extends Node2D

var SimpleBall = load("res://SimpleBall.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.


func _input(ev):
	if ev is InputEventMouseButton and ev.pressed:
		var new_ball = SimpleBall.instance()
		new_ball.position = ev.position - get_global_transform_with_canvas().origin
		new_ball.color = Color(randi())
		new_ball.radius = randi() % 50 + 10
		add_child(new_ball)
