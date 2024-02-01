extends Camera3D
var bullet = preload("res://rigid_body_3d.tscn")
@onready var shootpostion = $"../../MeshInstance3D/Marker3D"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var root = get_tree().get_root().get_node("world") 
	if Input.is_action_just_pressed("shoot"):
		var newbullet = bullet.instantiate() 
		newbullet.transform = shootpostion.global_transform
		#newbullet.rotation.y = $"../../MeshInstance3D".rotation.y 
		root.add_child(newbullet)
	pass
