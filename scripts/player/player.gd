extends CharacterBody2D

@onready var _animation_player = $AnimatedSprite2D
const SPEED = 20000
var direction = "up" 

func update_direction():
	if Input.is_action_pressed("move_left"):
		_animation_player.flip_h = false
		direction = "left"
	if Input.is_action_pressed("move_right"):
		_animation_player.flip_h = true
		direction = "right"
	if Input.is_action_pressed("move_up"):
		direction = "up"
	if Input.is_action_pressed("move_down"):
		direction = "down"

#Renvoie vrai si le joueur a utilisé son épée à cette frame là
func swung_sword() -> bool:
	return Input.is_action_just_pressed("swing_sword")

#Renvoie vrai si le joueur a interagi avec un objet
func interacted() -> bool:
	return Input.is_action_just_pressed("interact")

func _physics_process(delta):
	# Mouvement du joueur
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED * delta

	move_and_slide()
	
	# Animation
	update_direction()
	if Input.is_anything_pressed():
		# print_debug("oui") # ça print il faut fix le reste imo
		if swung_sword():
			match (direction):
				"up":
					_animation_player.play("up_attack")
				"down":
					_animation_player.play("down_attack")
				"left":
					_animation_player.play("left_attack")
				"right":
					_animation_player.play("left_attack")
		elif interacted():
			_animation_player.play("left_pick_up")
		else:
			pass
	else:
		match (direction):
			"up":
				_animation_player.play("up_idle")
			"down":
				_animation_player.play("down_idle")
			"left":
				_animation_player.play("left_idle")
			"right":
				_animation_player.play("left_idle")
