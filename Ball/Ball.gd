extends KinematicBody2D

export var SPEED = 2

var velocity = Vector2(10, 50)

func _physics_process(delta):
	var collision = move_and_collide(velocity * SPEED * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
