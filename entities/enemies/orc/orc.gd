extends CharacterBody2D

var speed = 40
var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase:
		
		$AnimatedSprite2D.play("runing")
		position += (player.position - position)/speed
		
		if player.position > position:
			scale.x = 1
		elif player.position < position:
			scale.x = -1
		
	else:
		$AnimatedSprite2D.play("idling")
		
		
	

func _on_colision_shape_body_entered(body):
	player = body
	player_chase = true

func _on_colision_shape_body_exited(body):
	player = null
	player_chase = false;
