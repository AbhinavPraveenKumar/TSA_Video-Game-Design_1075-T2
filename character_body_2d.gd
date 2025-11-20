extends CharacterBody2D


var SPEED = 300.0
var JUMP_VELOCITY = -400.0
var current_health = 100
var max_health = 100

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	# Implements sprint function
	var sprint := Input.is_action_pressed("sprint")
	if sprint:
		SPEED = 450
		JUMP_VELOCITY = -600.0
	else:
		SPEED = 300
		JUMP_VELOCITY = -400.0
	move_and_slide()
