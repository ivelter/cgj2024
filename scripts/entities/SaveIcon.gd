extends CharacterBody2D

@onready var collider = $Area2D
var isEntered = false 

func _ready():
	collider.connect("body_entered", on_grave_entered)

func _physics_process(delta):
	if(Input.is_action_just_pressed("interact") and isEntered):
		SaveManager.savePlayerData()

func on_grave_entered(body: Node):
	isEntered = true

func on_grave_exited(body: Node):
	isEntered = false
