extends KinematicBody2D

export var speed = 4

var velocity = Vector2(rand_range(-10, 10), -25)

func _physics_process(delta):
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		$BallBounceSound.play()
		velocity = velocity.bounce(collision.normal)
