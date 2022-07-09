extends Spatial

var Ball = load("res://Ball.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#func _input(ev):
#	if ev is InputEventMouseButton and ev.pressed:


func spawn_ball(position: Vector3):
	var new_ball = Ball.instance()
	new_ball.translate(position)
	new_ball.set_color(Color(randi()))
	new_ball.set_radius(randf() * 5)
	add_child(new_ball)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Platform_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		spawn_ball(position)
