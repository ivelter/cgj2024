extends RichTextLabel

func _physics_process(delta):
	var currAlt = PlayerInfo.currentAltitude
	text = str(currAlt) + " m"
