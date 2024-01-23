extends Node

func scene_changer():
	var scene_selection = [1, 2, 3]
	randomize()
	var object = scene_selection[randi() % scene_selection.size()]
	return "res://scenes/game/iles/" + str(object) + ".tscn"

func change_scene():
	var chemin = null
	while (chemin == get_tree().edited_scene_root.get_resource_path() || chemin == null):
		chemin = scene_changer()
	print_debug(chemin)
	get_tree().change_scene_to_file(chemin)

func load_scene(name):
	get_tree().change_scene_to_file("res://scenes/" + name)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
"""
func _process(delta):
	pass
"""
