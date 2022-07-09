extends KinematicBody

var Ball = load("res://Ball.tscn")

onready var camera = $RotationPivot/Camera
onready var rotation_pivot = $RotationPivot

var gravity = -30
var max_speed = 8
var mouse_sensitivity = 0.002 # radians/pixel
var velocity = Vector3()

var JUMP_SPEED = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$Pop.play()



func _physics_process(delta):
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		velocity.y += gravity * delta
		
		var input_dir = Vector3()
		if Input.is_action_pressed("ui_up"):
			input_dir += -camera.global_transform.basis.z
		if Input.is_action_pressed("ui_down"):
			input_dir += camera.global_transform.basis.z
		if Input.is_action_pressed("ui_left"):
			input_dir += -camera.global_transform.basis.x
		if Input.is_action_pressed("ui_right"):
			input_dir += camera.global_transform.basis.x
		var desired_velocity = input_dir.normalized() * max_speed
		velocity.x = desired_velocity.x
		velocity.z = desired_velocity.z
		if is_on_floor() and Input.is_action_pressed("jump"):
			velocity.y = JUMP_SPEED
		velocity = move_and_slide(velocity, Vector3.UP, true)
		if Input.is_action_pressed("shoot"):
			var new_ball = Ball.instance()
			new_ball.translate(transform.origin)
			new_ball.set_color(Color(randi()))
			new_ball.set_radius(randf() * 5)
			get_parent().add_child(new_ball)
		


func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		rotate_y(-event.relative.x * mouse_sensitivity)
		rotation_pivot.rotation.x = clamp(rotation_pivot.rotation.x, -1.2, 1.2)
