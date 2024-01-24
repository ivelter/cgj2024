extends CharacterBody2D

var speed = 100
var player_chase = false
var player = null

var bulletPath = preload("res://entities/enemies/bigMouth/fireball/fireball.tscn")

func _physics_process(delta):
	
		
	if player_chase:
		$AnimatedSprite2D.play("runing")
		velocity = position.direction_to(player.position - position / 2) * speed
		move_and_slide()
			
		if randi_range(0, 100) > 98:
			shoot()
		
	else:
		$AnimatedSprite2D.play("idling")
	

func _on_colision_shape_body_entered(body):
	player = body
	player_chase = true

func _on_colision_shape_body_exited(body):
	player = null
	player_chase = false;

func shoot():
	var bullet = bulletPath.instantiate()
	# Add the node as a child of the node the script is attached to.
	get_tree().root.add_child(bullet)
	bullet.position = position
	var dir = (player.position - position).normalized()
	bullet.setDirection(dir)
	
