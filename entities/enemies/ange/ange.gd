extends CharacterBody2D

var speed = 200
var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase:
		$AnimatedSprite2D.play("runing")
		velocity = position.direction_to(player.position) * speed
		move_and_slide()
	else:
		$AnimatedSprite2D.play("idling")


func _on_colision_shape_body_entered(body):
	player = body
	player_chase = true


func _on_colision_shape_body_exited(body):
	player = null
	player_chase = false;
