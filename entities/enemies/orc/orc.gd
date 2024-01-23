extends CharacterBody2D

var health = 2
var speed = 60
var player_chase = false
var player = null
var canAttack = true;

func _physics_process(delta):
	if player != null:
		if player_chase:
			$AnimatedSprite2D.play("runing")
			position += (player.position - position)/speed
			if player.position > position:
				scale.x = 1
			elif player.position < position:
				scale.x = -1

			if(canAttack):
				if((max(player.position.x,position.x) - min(player.position.x,position.x)) < 50 && (max(player.position.y,position.y) - min(player.position.y,position.y)) < 50):
					player.take_dmg()
					canAttack = false;
					$Timer.start()
					if get_tree() != null:
						await get_tree().create_timer(2).timeout
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
