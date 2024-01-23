extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var target = get_node("ress://entities/player.player.tscn").getPosition()

var speed = 300

func _process(_delta):
	if velocity.x == 0 && velocity.y == 0:
		_animated_sprite.play("idling")
	else:
		_animated_sprite.play("runing")
		
	# target = get_node("CollisionShape2D").getPosition()
		
	velocity = position.direction_to(target) * speed
	
	# look_at(target)
	if position.distance_to(target) > 15:
		move_and_slide()
