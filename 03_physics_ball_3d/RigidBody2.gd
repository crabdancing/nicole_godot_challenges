extends RigidBody



# Called when the node enters the scene tree for the first time.
func _ready():
	$MeshInstance.create_convex_collision()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
