extends CharacterBody2D

@onready var collider = $Area2D

func _ready():
	collider.connect("body_entered", on_portal_entered)

func _physics_process(delta):
	pass

func on_portal_entered(body: Node):
	PlayerInfo.currentAltitude += 50
	SceneManager.change_scene()
	#SceneManager.load_scene("game/ile0.tscn")
