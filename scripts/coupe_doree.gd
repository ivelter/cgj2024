extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_coupe(body):
	#print("nouveau niveauu")
	#SceneManager.load_scene("game/TestSceneBri.tscn")
	SceneManager.load_scene("game/ile1.tscn")
