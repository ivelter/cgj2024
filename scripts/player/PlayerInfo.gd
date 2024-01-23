extends Node

var healthPoints
var maxHealthPoints
var hasUnlockedStone1
var hasUnlockedStone2
var hasUnlockedStone3
var hasUnlockedDiary


# Called when the node enters the scene tree for the first time.
func _ready():
	healthPoints = 3
	maxHealthPoints = 3
	hasUnlockedStone1 = false
	hasUnlockedStone2 = false
	hasUnlockedStone3 = false
	hasUnlockedDiary = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
"""
func _process(delta):
	pass
"""
