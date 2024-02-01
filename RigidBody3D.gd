extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_player_detected:
		apply_central_force(player.global_position - global_position)
	pass
var is_player_detected=false 
var player


func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		player = body 
		is_player_detected = true 
	# Replace with function body.
