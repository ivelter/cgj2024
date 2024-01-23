extends CharacterBody2D

@onready var _animation_player = $AnimatedSprite2D
const SPEED = 20000
var directionOfPlayer = "up" 

func update_direction():
	if Input.is_action_pressed("move_left"):
		_animation_player.flip_h = false
		directionOfPlayer = "left"
	if Input.is_action_pressed("move_right"):
		_animation_player.flip_h = true
		directionOfPlayer = "right"
	if Input.is_action_pressed("move_up"):
		directionOfPlayer = "up"
	if Input.is_action_pressed("move_down"):
		directionOfPlayer = "down"

#Renvoie vrai si le joueur a utilisé son épée à cette frame là
func swung_sword() -> bool:
	return Input.is_action_just_pressed("swing_sword")

#Renvoie vrai si le joueur a interagi avec un objet
func interacted() -> bool:
	return Input.is_action_just_pressed("interact")

#Update l'animation en fonction de si le joueur a fait une action
func animationInteractionUpdate() -> void:
	if Input.is_anything_pressed():
		if swung_sword():
			match (directionOfPlayer):
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
			match (directionOfPlayer):
				"up":
					_animation_player.play("up_walk")
				"down":
					_animation_player.play("down_walk")
				"left":
					_animation_player.play("left_walk")
				"right":
					_animation_player.play("left_walk")

func _ready():
	_animation_player.play(directionOfPlayer + "_idle")

func _physics_process(delta):
	# Mouvement du joueur
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED * delta

	move_and_slide()
	
	# Animation
	update_direction()
	# Override de l'animation si jamais le joueur fait une action
	animationInteractionUpdate()

# Signal handler for animation finished
func _on_animation_player_animation_finished(anim_name: String) -> void:
	if Input.is_anything_pressed():
		animationInteractionUpdate()
	else:
		match (directionOfPlayer):
			"up":
				_animation_player.play("up_idle")
			"down":
				_animation_player.play("down_idle")
			"left":
				_animation_player.play("left_idle")
			"right":
				_animation_player.play("left_idle")
