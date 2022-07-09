extends Spatial

var Ball = load("res://Ball.tscn")



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event is InputEventMouseButton and Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
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
