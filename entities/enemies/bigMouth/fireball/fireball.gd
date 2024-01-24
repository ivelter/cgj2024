extends CharacterBody2D

@export var speed = 500

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


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		print("touche")
		body.take_dmg(1)
