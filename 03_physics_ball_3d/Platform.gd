extends RigidBody



# Called when the node enters the scene tree for the first time.
func _ready():
	var mesh: CubeMesh = $MeshInstance.mesh
	var aabb: AABB = mesh.get_aabb()
	print($CollisionObject.shape_owner_get_shape())
	input_ray_pickable = true
	# TODO: this convex collision doesn't seem to trigger mouse raytracing from camera
	# - we know the spheres work, and they are using a more conventional collision shape object
	# - So do the same here
	# - figure out how to translate between a mesh shape and a boxagent
	# ALSO CONSIDER:
	# - rather than using this approach, we could totally create a FPS where you launch balls out of your face -- no raytracing required!
	# $MeshInstance.create_convex_collision()
	#connect("input_event", self, "on_input_event")
	
