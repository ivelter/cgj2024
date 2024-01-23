extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var target = $Player
var speed = 500

func _process(_delta):
	position = target.getPosition()
	if velocity.x == 0 && velocity.y == 0:
		_animated_sprite.play("idling")
	else:
		_animated_sprite.play("runing")
		
	# target = get_node("CollisionShape2D").getPosition()
		
	velocity = position.direction_to(target) * speed
	
	# look_at(target)
	if position.distance_to(target) > 10:
		move_and_slide()
