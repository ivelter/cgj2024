extends CharacterBody2D

@onready var collider = $Area2D
var isEntered = false 
var is_playing = false

func _ready():
	if (!PlayerInfo.hasUnlockedStone2):
		collider.connect("body_entered", on_grave_entered)
		collider.connect("body_exited", on_grave_exited)
	else:
		hide()

func _physics_process(delta):
	if (Input.is_action_just_pressed("interact") and isEntered):
		PlayerInfo.unlockStone2()
		PlayerInfo.maxHealthPoints += 2
		hide()
		if !is_playing:
			AudioManager.playPickSound()
			is_playing = true
		
	await get_tree().create_timer(1.5).timeout
	is_playing = false
	

func on_grave_entered(body: Node):
	isEntered = true

func on_grave_exited(body: Node):
	isEntered = false
