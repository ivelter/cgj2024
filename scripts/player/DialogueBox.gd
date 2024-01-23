extends ColorRect

@onready var text = $TextContent

const stoneTablet1_content = """
ℸ ̣ ⍑ᒷ ℸ ̣ ∷ᔑ╎ℸ ̣ 𝙹∷ᓭ ꖎᒷ⎓ℸ ̣  ⚍ᓭ ↸ᒷᔑ↸
En l’an 131 avant AC, une guerre terrible eu lieu entre les Atlantes et une race extraterrestre venue d’ailleurs. Bien que les Atlantes ont gagné, plusieurs colonies furent perdu. Une de ces colonies réussis quand même à survivre et à se réfugier sur une île. Ils envoyèrent des messages de détresse, mais personne ne vint jamais à leur secours.
"""

const stoneTablet2_content = """
ʖ⚍ℸ ̣  ∴ᒷ ⎓𝙹⚍リ↸ ⎓ᔑ╎ℸ ̣ ⍑ ╎リ aᒷᓭ╎∷
Pris de rage de par la lâcheté de leur peuple, ils décidèrent de bâtir leur propre cité ainsi que leur propre religion. Ils voulurent par la suite se venger des Atlantes. Pour cela, grâce à un sort très puissant, ils créèrent un donjon, semblant infini. Quiconque arrivera au sommet sera doté d’un pouvoir incommensurable.
"""

const stoneTablet3_content = """
ᔑリ↸ aᒷᓭ╎∷ ∴╎ꖎꖎ ᔑ⍊ᒷリ⊣ᒷ ⚍ᓭ ╎リ ℸ ̣ ⍑ᒷ リᔑᒲᒷ 𝙹⎓ ᔑꖎꖎ ⍑╎ᓭ ⎓ᔑ╎ℸ ̣ ⍑⎓⚍ꖎ
Les trois tablettes contiennent chacune une partie de l’invocation d’Aesir, quiconque possède les trois peut l’invoquer et ainsi venger cette colonie des Atlantes. Mais à quel prix ?
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
