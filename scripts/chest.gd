extends Node

var contenu = "arc";
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func is_chest():
	return true;
func open():
	print("Chest opened!")
	return contenu
