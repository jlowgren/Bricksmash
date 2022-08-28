extends KinematicBody2D

export var ACCELERATION = 25
export var FRICTION = 10
export var MAX_SPEED = 120

var velocity = Vector2.ZERO

func _physics_process(delta):
	var input_vector = get_input_vector()
	
	if input_vector == Vector2.ZERO:
		# Decelerate to zero
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	else:
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED * delta)
	
	# Move pixel perfectly
	var pixel_perfect_vector = Vector2(round(velocity.x), round(velocity.y))
	
	move_and_collide(pixel_perfect_vector)

func get_input_vector() -> Vector2:
	var v = Vector2.ZERO
	v.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	return v.normalized()
