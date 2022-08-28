extends Node2D

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
	if event.is_action_pressed("toggle_fullscreen"):
		OS.set_window_fullscreen(!OS.window_fullscreen)
