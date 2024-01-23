extends ColorRect

@onready var text = $TextContent

const stoneTablet1_content = """

"""

const stoneTablet2_content = """

"""

const stoneTablet3_content = """

"""

const diary_content = """

"""

# Called when the node enters the scene tree for the first time.
func _ready():
	closeBox()
	
func displayBox():
	show()

func closeBox():
	hide()

func display_stone1():
	text.text = stoneTablet1_content 
	displayBox()

func display_stone2():
	text.text = stoneTablet2_content 
	displayBox()

func display_stone3():
	text.text = stoneTablet3_content 
	displayBox()

func display_diary():
	text.text = diary_content
	displayBox()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
