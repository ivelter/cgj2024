extends Node

var ilesSelection = [
	"ile0",
	"ile1",
	"ile2",
	"ile5"
]
var previousScene = "null"

func scene_changer():
	randomize()
	var object
	if (previousScene == "null"):
		object = ilesSelection[randi() % ilesSelection.size()]
	else:
		object = ilesSelection[randi() % ilesSelection.size()]
		while object == previousScene:
			object = ilesSelection[randi() % ilesSelection.size()]
	previousScene = object
	return "res://scenes/game/" + str(object) + ".tscn"

func change_scene():
	#var chemin = null
	#while (chemin == get_tree().edited_scene_root.get_resource_path() || chemin == null):
	#	chemin = scene_changer()
	#print_debug(chemin)
	get_tree().change_scene_to_file(scene_changer())

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
