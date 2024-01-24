extends CharacterBody2D

@export var speed = 750

var direction = 0
var player = null


func _ready():
	if(get_tree().get_nodes_in_group("player") != null):
		player = get_tree().get_nodes_in_group("player")
	set_process(false)

func setDirection(dir):
	direction = dir
	set_process(true)
	

func _process(delta):

	position += speed * delta * direction
	
