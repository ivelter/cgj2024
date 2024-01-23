extends Node

"""
healthPoints = 3
	maxHealthPoints = 3
	hasUnlockedStone1 = false
	hasUnlockedStone2 = false
	hasUnlockedStone3 = false
	hasUnlockedDiary = false
"""

func playerDataToJSON():
	return {
		"healthPoints": PlayerInfo.healthPoints,
		"maxHealthPoints": PlayerInfo.maxHealthPoints,
		"hasUnlockedStone1": PlayerInfo.hasUnlockedStone1,
		"hasUnlockedStone2": PlayerInfo.hasUnlockedStone2,
		"hasUnlockedStone3": PlayerInfo.hasUnlockedStone3,
		"hasUnlockedDiary" : PlayerInfo.hasUnlockedDiary
	}

func savePlayerData():
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_string(playerDataToJSON())

func loadPlayerData() -> bool:
	if data_exists():
		var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
		var content = file.get_as_text()
		return true
	return false

func data_exists() -> bool:
	return FileAccess.file_exists("user://save_game.dat")
