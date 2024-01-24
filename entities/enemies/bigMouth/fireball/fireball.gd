extends CharacterBody2D

@export var speed = 750

var direction = 0


func _ready():
	set_process(false)

func setDirection(dir):
	direction = dir
	set_process(true)
	

func _process(delta):

	position += speed * delta * direction
	
