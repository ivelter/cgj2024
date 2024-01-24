extends CharacterBody2D
var health = 1
var speed = 400
var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase:
		$AnimatedSprite2D.play("runing")
		position += (player.position - position).normalized() * delta * speed
		if player.position > position:
			scale.x = 1
		else:
			scale.x = -1
		
		var dir = (player.position - position).normalized()
		if dir.x > 0:
			$AnimatedSprite2D.scale.x = 3
		else:
			$AnimatedSprite2D.scale.x = -3
		
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
