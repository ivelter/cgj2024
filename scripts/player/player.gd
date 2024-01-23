extends CharacterBody2D

@onready var animation_player = $AnimatedSprite2D
@onready var playerInfo = PlayerInfo
@onready var hurtBox = $Hurtbox
const SPEED = 20000
var directionOfPlayer = "up" 
var playerState = "idle"

func update_direction():
	if Input.is_action_pressed("move_left"):
		animation_player.flip_h = false
		directionOfPlayer = "left"
	if Input.is_action_pressed("move_right"):
		animation_player.flip_h = true
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
func animationInteractionUpdate(anim_name: String = "") -> void:
	if Input.is_anything_pressed():
		if swung_sword():
			playerState = "swung_sword"
			match (directionOfPlayer):
				"up":
					animation_player.play("up_attack")
				"down":
					animation_player.play("down_attack")
				"left":
					animation_player.play("left_attack")
				"right":
					animation_player.play("left_attack")
		elif interacted():
			playerState = "interacting"
			animation_player.play("left_pick_up")
		elif playerState == "idle" or playerState == "walking":
			playerState = "walking"
			match (directionOfPlayer):
				"up":
					animation_player.play("up_walk")
				"down":
					animation_player.play("down_walk")
				"left":
					animation_player.play("left_walk")
				"right":
					animation_player.play("left_walk")
	else:
		if playerState == "walking":
			match (directionOfPlayer):
				"up":
					animation_player.play("up_idle")
				"down":
					animation_player.play("down_idle")
				"left":
					animation_player.play("left_idle")
				"right":
					animation_player.play("left_idle")

func _ready():
	animation_player.play(directionOfPlayer + "_idle")
	animation_player.connect("animation_finished", _on_animation_player_animation_finished)

func _physics_process(delta):
	# Mouvement du joueur
	if(playerState == "idle" or playerState == "walking"):
		var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = direction * SPEED * delta
	else:
		velocity = Vector2(0, 0)
	move_and_slide()
	
	# Animation
	update_direction()
	# Override de l'animation si jamais le joueur fait une action
	animationInteractionUpdate()

# Signal pour quand une anim se finit
func _on_animation_player_animation_finished() -> void:
	print_debug("oui.")
	var anim_name = animation_player.animation
	playerState = "idle"
	if Input.is_anything_pressed():
		animationInteractionUpdate(anim_name)
	else:
		match (directionOfPlayer):
			"up":
				animation_player.play("up_idle")
			"down":
				animation_player.play("down_idle")
			"left":
				animation_player.play("left_idle")
			"right":
				animation_player.play("left_idle")
