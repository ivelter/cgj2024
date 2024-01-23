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
	hasUnlockedStone1 = true
	hasUnlockedStone2 = false
	hasUnlockedStone3 = false
	hasUnlockedDiary = false

func checkDiaryUnlock():
	if hasUnlockedStone1 and hasUnlockedStone2 and hasUnlockedStone3:
		hasUnlockedDiary = true

func unlockStone1():
	hasUnlockedStone1 = true
	checkDiaryUnlock()

func unlockStone2():
	hasUnlockedStone2 = true
	checkDiaryUnlock()

func unlockStone3():
	hasUnlockedStone3 = true
	checkDiaryUnlock()

# Called every frame. 'delta' is the elapsed time since the previous frame.
"""
func _process(delta):
	pass
"""
