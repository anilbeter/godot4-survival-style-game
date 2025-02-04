extends CharacterBody2D

const MAX_SPEED = 200


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement_vector = get_movement_vector()
	# let's normalize vector (make vector length 1) so I able to change movement speed easily
	var direction = movement_vector.normalized()
	
	# coming from CharacterBody2D
	velocity = direction * MAX_SPEED
	move_and_slide()

func get_movement_vector():
	# get_action_strength -> always returns 0 or 1 depends on which key pressed
	# if I press D key (right) move_left value will be 0 and x_movement will be 1
	# if I press A key(left) move_right will be 0 and x_movement will be -1
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement, y_movement)
