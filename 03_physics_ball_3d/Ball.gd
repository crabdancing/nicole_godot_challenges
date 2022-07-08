tool
extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var radius: float = 1 setget set_radius
export var color: Color = Color(100, 100, 100) setget set_color
var am_ready = false
var diameter = radius * 2

func set_radius(new_radius):
	radius = new_radius
	update_radius()

func set_color(new_color):
	color = new_color
	update_color()
	
func update_radius():
	if am_ready:
		diameter = radius * 2
		var scale_visibility_notifier = 4
		$VisibilityNotifier.aabb.size = Vector3 (
			diameter * scale_visibility_notifier,
			diameter * scale_visibility_notifier,
			diameter * scale_visibility_notifier
		)
		$VisibilityNotifier.aabb.position = Vector3 (
			Vector3(-radius * scale_visibility_notifier ,
					-radius * scale_visibility_notifier ,
					-radius * scale_visibility_notifier 
			)
		) 
		$CollisionShape.shape.radius = radius
		$MeshInstance.mesh.set_radius(radius)
		$MeshInstance.mesh.set_height(radius*2)

func update_color():
	if am_ready:
		var material: SpatialMaterial = SpatialMaterial.new()
		material.albedo_color=color
		$MeshInstance.material_override = material
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$MeshInstance.mesh = SphereMesh.new()
	$CollisionShape.shape = SphereShape.new()
	am_ready = true
	update_radius()
	update_color()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier_camera_exited(_camera):
	# NOTE: this will trigger if any camera is exited
	# If you have multiple, make sure you figure out some logic for the conditional!
	# print(self, ' I die now >.<')
	queue_free()
