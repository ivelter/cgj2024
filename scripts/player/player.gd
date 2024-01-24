extends CharacterBody2D

@onready var animation_player = $AnimatedSprite2D
@onready var hurtBox = $Hurtbox
@onready var healthBar = $HealthBar
const SPEED = 20000
var walkingSpeed = 1.0
var directionOfPlayer = "up" 
var playerState = "idle"
var arc = false
var chest = null
var up = false
var left = false
var right = false
var down = false
var enemyU = null
var enemyL = null
var enemyR = null
var enemyD = null

func show_message(text):
	DialogueBox.display_text(text)

func _process(delta):
	# Vérifiez si le CharacterBody2D est en collision
	#if is_colliding():
		# Obtenez le corps de collision
	if get_last_slide_collision() != null:
		var colliding_body = get_last_slide_collision().get_collider()
		if(colliding_body != null):
			if colliding_body.name == "SkyTileMap":
				die()

# Fonction pour vérifier si le CharacterBody2D est en collision
##func is_colliding() -> bool:
	#return collide()

	
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
					if(up && enemyU != null):
						enemyU.take_dmg()
				"down":
					animation_player.play("down_attack")
					if(down and enemyD != null):
						enemyD.take_dmg()
				"left":
					animation_player.play("left_attack")
					if(left and enemyL !=null):
						enemyL.take_dmg()
				"right":
					animation_player.play("left_attack")
					if(right and enemyR != null):
						enemyR.take_dmg()
		elif interacted():
			playerState = "interacting"
			animation_player.play("left_pick_up")
			open(chest)
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
	DialogueBox.setPlayerRef(self)
	DialogueBox.closeBox()
	update_health_bar()

func _physics_process(delta):
	#test
	"""
	if Input.is_action_just_pressed("test_key_1"):
		take_dmg()
		print_debug(PlayerInfo.healthPoints)
	"""
	
	# Mouvement du joueur
	if Input.is_action_pressed("dash"):
		walkingSpeed = 1.5
		animation_player.speed_scale = 1.5
	else:
		walkingSpeed = 1.0
		animation_player.speed_scale = 1.0
	
	if(playerState == "idle" or playerState == "walking"):
		var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = direction * SPEED * walkingSpeed * delta
	else:
		velocity = Vector2(0, 0)
	move_and_slide()
	
	# Animation
	update_direction()
	# Override de l'animation si jamais le joueur fait une action
	animationInteractionUpdate()

# Signal pour quand une anim se finit
func _on_animation_player_animation_finished() -> void:
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


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		chest = body

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		chest = null

func open(chest):
	if chest != null:
		arc = true
		print("arc obtenu")
		chest = null

func take_dmg(damage: int = 1) -> void:
	playerState = "aMal";
	if playerState == "aMal":
		animation_player.play("hit")
	PlayerInfo.healthPoints -= damage
	if PlayerInfo.healthPoints <= 0:
		die()
	update_health_bar()

func set_health(health: int = 3) -> void:
	PlayerInfo.healthPoints = health 
	if health <= 0:
		die()
	update_health_bar()

func die() -> void:
	playerState = "dead"
	if playerState == "dead" :
		animation_player.play("mort")
	show_message("GAME OVER !!!")
	await get_tree().create_timer(1.5).timeout
	PlayerInfo.healthPoints = PlayerInfo.maxHealthPoints
	PlayerInfo.currentAltitude = 0
	SceneManager.load_scene("game/Hub.tscn")

func update_health_bar() -> void:
	healthBar.max_value = PlayerInfo.maxHealthPoints
	healthBar.value = PlayerInfo.healthPoints
	
	
func _on_up_area_body_entered(body):
	if(body.has_method("is_enemy")):
		up = true
		enemyU = body
	else:
		up = false


func _on_down_area_body_entered(body):
	if(body.has_method("is_enemy")):
		down = true
		enemyD = body
	else:
		down = false


func _on_left_area_body_entered(body):
	if(body.has_method("is_enemy")):
		left = true
		enemyL = body
	else:
		left = false


func _on_right_area_body_entered(body):
	if(body.has_method("is_enemy")):
		right = true
		enemyR = body
	else:
		right = false
