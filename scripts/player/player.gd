extends CharacterBody2D

@onready var _animation_player = $AnimationPlayer
const SPEED = 20000
var direction = "up" 

func update_direction():
	if Input.is_action_pressed("move_left"):
		direction = "left"
	if Input.is_action_pressed("move_right"):
		direction = "right"
	if Input.is_action_pressed("move_up"):
		direction = "up"
	if Input.is_action_pressed("move_down"):
		direction = "down"

#Renvoie vrai si le joueur a utilisé son épée à cette frame là
func swung_sword() -> bool:
	return Input.is_action_pressed("swing_sword")

#Renvoie vrai si le joueur a interagi avec un objet
func interacted() -> bool:
	return Input.is_action_pressed("interact")

func _physics_process(delta):
	# Mouvement du joueur
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED * delta

	move_and_slide()
	
	# Animation
	update_direction()
	if Input.is_anything_pressed():
		if swung_sword():
			pass
		elif interacted():
			pass
		else:
			pass
	else:
		match (direction):
			"up":
				pass
			"down":
				_animation_player.play("down_idle")
			"left":
				pass
			"right":
				pass
