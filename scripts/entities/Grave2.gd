extends CharacterBody2D

@onready var collider = $Area2D
var isEntered = false 
var isOpened = false

func _ready():
	if (PlayerInfo.hasUnlockedStone2):
		collider.connect("body_entered", on_grave_entered)
		collider.connect("body_exited", on_grave_exited)
	else:
		hide()

func _physics_process(delta):
	if (Input.is_action_just_pressed("interact") and isEntered):
		DialogueBox.display_stone2()
		isOpened = true 
	if (Input.is_action_just_pressed("swing_sword") and isOpened):
		DialogueBox.closeBox()
		isOpened = false

func on_grave_entered(body: Node):
	isEntered = true

func on_grave_exited(body: Node):
	isEntered = false
