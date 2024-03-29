extends CharacterBody3D
@export var mouse_sensetivity := 0.005

const SPEED = 16.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	direction=direction.rotated(Vector3.UP,$SpringArm3D.rotation.y).normalized()
	if direction: 
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
func _input(event): 
	if event is InputEventMouseMotion:
		rotation.x -= event.relative.y * mouse_sensetivity 
		rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(30))
		rotation.y -= event.relative.x * mouse_sensetivity 
		rotation.y = wrapf(rotation.y, -PI, PI )
	
	 
#rotate the mesh add a line at after 27  then add momentum. then you should start making enimies 

var health=100 
func _on_area_3d_body_entered(body):
	if body.is_in_group("bad guy"):
		health-=.5 
		print(health)
		
