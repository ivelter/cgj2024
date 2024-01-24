extends CharacterBody2D

var speed = 100
var player_chase = false
var player = null

var bulletPath = preload("res://entities/enemies/bigMouth/fireball/fireball.tscn")

func _physics_process(delta):
	
		
	if player_chase:
		$AnimatedSprite2D.play("runing")
		velocity = position.direction_to(player.position - position / 2) * speed
		var dir = (player.position - position).normalized()

		print( dir.x > 0)

		if dir.x > 0:
			$AnimatedSprite2D.scale.x = 3
		else:
			$AnimatedSprite2D.scale.x = -3
			
		if randi_range(0, 100) > 98:
			shoot(dir)
			
		move_and_slide()
		
	else:
		$AnimatedSprite2D.play("idling")
	

func _on_colision_shape_body_entered(body):
	player = body
	player_chase = true

func _on_colision_shape_body_exited(body):
	player = null
	player_chase = false;

func shoot(dir):
	var bullet = bulletPath.instantiate()
	# Add the node as a child of the node the script is attached to.
	get_tree().root.add_child(bullet)
	bullet.position = position
	
	bullet.setDirection(dir)
	
