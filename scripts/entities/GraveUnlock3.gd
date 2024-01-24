extends CharacterBody2D

@onready var collider = $Area2D
var isEntered = false 

func _ready():
	if (!PlayerInfo.hasUnlockedStone3):
		collider.connect("body_entered", on_grave_entered)
		collider.connect("body_exited", on_grave_exited)
	else:
		hide()

func _physics_process(delta):
	if (Input.is_action_just_pressed("interact") and isEntered):
		PlayerInfo.unlockStone3()
		PlayerInfo.maxHealthPoints += 1
		hide()

func on_grave_entered(body: Node):
	isEntered = true

func on_grave_exited(body: Node):
	isEntered = false
