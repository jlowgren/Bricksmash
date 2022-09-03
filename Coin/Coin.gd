extends StaticBody2D

onready var animation_player := $AnimationPlayer

func _on_Area2D_body_entered(body):
	$Sprite.visible = false
	animation_player.play("picked")
