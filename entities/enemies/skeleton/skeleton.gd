extends CharacterBody2D

var speed = 200
var health = 1
var player_chase = false
var player = null
var canAttack = true;

func _physics_process(delta):
	
	if player_chase:
		$AnimatedSprite2D.play("runing")
		velocity = position.direction_to(player.position) * speed
		move_and_slide()
		
		var dir = (player.position - position).normalized()
		if dir.x > 0:
			$AnimatedSprite2D.scale.x = 3
		else:
			$AnimatedSprite2D.scale.x = -3
			
		if(canAttack):
				if((max(player.position.x,position.x) - min(player.position.x,position.x)) < 32 && (max(player.position.y,position.y) - min(player.position.y,position.y)) < 32):
					player.take_dmg()
					canAttack = false;
					$Timer.start()
					if get_tree() != null:
						await get_tree().create_timer(3).timeout
					$Timer.timeout
					canAttack = true;
			
	else:
		$AnimatedSprite2D.play("idling")


func _on_colision_shape_body_entered(body):
	player = body
	player_chase = true

func _on_colision_shape_body_exited(body):
	player = null
	player_chase = false;
	
func take_dmg(damage: int = 1) -> void:
	health -= damage
	if health <= 0:
		queue_free()
		
func is_enemy():
	return true;
