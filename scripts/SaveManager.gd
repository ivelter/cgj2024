extends Node

func playerDataToJSON():
	return JSON.stringify({
		"healthPoints": PlayerInfo.healthPoints,
		"maxHealthPoints": PlayerInfo.maxHealthPoints,
		"hasUnlockedStone1": PlayerInfo.hasUnlockedStone1,
		"hasUnlockedStone2": PlayerInfo.hasUnlockedStone2,
		"hasUnlockedStone3": PlayerInfo.hasUnlockedStone3,
		"hasUnlockedDiary" : PlayerInfo.hasUnlockedDiary
	})

func savePlayerData():
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_string(playerDataToJSON())

func loadPlayerData() -> bool:
	if data_exists():
		var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
		var content = file.get_as_text()
		var playerinf = JSON.parse_string(content)
		if playerinf == null: 
			return false
			
		# rétablissement des données
		PlayerInfo.healthPoints = playerinf.healthPoints
		PlayerInfo.maxHealthPoints = playerinf.maxHealthPoints
		PlayerInfo.hasUnlockedStone1 = playerinf.hasUnlockedStone1
		PlayerInfo.hasUnlockedStone2 = playerinf.hasUnlockedStone2
		PlayerInfo.hasUnlockedStone3 = playerinf.hasUnlockedStone3
		PlayerInfo.hasUnlockedDiary  = playerinf.hasUnlockedDiary
		
		return true
	return false

func data_exists() -> bool:
	return FileAccess.file_exists("user://save_game.dat")
