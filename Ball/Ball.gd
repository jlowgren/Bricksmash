extends KinematicBody2D

signal ball_destroyed

export var speed = 4

var velocity = Vector2.ZERO

func _ready():
	randomize()
	velocity = Vector2(rand_range(-10, 10), -25)

func _physics_process(delta):
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		$BallBounceSound.play()
		velocity = velocity.bounce(collision.normal)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	emit_signal("ball_destroyed")
