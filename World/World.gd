extends Node2D

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

	if event.is_action_pressed("toggle_fullscreen"):
		OS.set_window_fullscreen(!OS.window_fullscreen)

func _ready():
	create_ball()

func _on_ball_destroyed():
	create_ball()

func create_ball():
	var ball_scene = load("res://Ball/Ball.tscn")
	var ball = ball_scene.instance()
	ball.connect("ball_destroyed", self, "_on_ball_destroyed")
	call_deferred("add_child", ball)
