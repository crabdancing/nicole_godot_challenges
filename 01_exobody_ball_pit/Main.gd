extends Node2D

var SimpleBall = load("res://SimpleBall.tscn")


func _ready():
	randomize()


func _input(ev):
	if ev is InputEventMouseButton and ev.pressed:
		if not $Platform.mouse_inside:
			var new_ball = SimpleBall.instance()
			new_ball.position = ev.position - get_global_transform_with_canvas().origin
			new_ball.color = Color(randi())
			new_ball.radius = randi() % 50 + 10
			add_child(new_ball)
