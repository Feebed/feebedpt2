extends RigidBody3D
const speed := 50 


# Called when the node enters the scene tree for the first time.
func _ready():


	apply_impulse(global_transform.basis.z * speed )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 
