extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Appelée quand on clique sur le bouton
func _on_pressed():
	# print_debug("Clic!")
	SceneManager.load_scene("game/Hub.tscn")
	# get_tree().change_scene_to_file("res://scenes/game/Level1.tscn")
