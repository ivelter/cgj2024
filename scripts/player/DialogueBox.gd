extends ColorRect

var textBox
var playerRef

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
Je suis un Atlante qui a cherché à se venger toute sa vie. J’ai cherché par tous les moyens à récupérer les trois tablettes d’invocation, mais en vain. Je n’étais pas à la hauteur. Si vous lisez ceci, c’est que vous cherchez la même chose que moi et que vous avez probablement réussi. C’est pourquoi je vous fais don de mon savoir à travers ces pages. Maintenant que vous avez détruit les Atlantes, vous devez penser avoir accompli votre devoir. Mais il n’en est rien. Il n’y a jamais eu de trahison. La guerre a bien eu lieu elle, mais il n’y a pas eu d’abandon. Nous avons juste fui, et avons cachés notre culpabilité avec une fausse histoire de trahison. Vous qui avez invoqué Aesir, vous n’avez causé que la perte de votre peuple. Et maintenant la terre entière va en périr. C’est bien dommage de finir comme ça. Mais que voulez vous, à part remonter dans le temps, faire machine arrière. Il est impossible de changer cela. Parfois il est bien que les secrets restent secrets.
"""

"""
# Called when the node enters the scene tree for the first time.
func _ready():
	#textBox = find_child("TextContent")
"""

func getRefOfDialogue():
	if textBox == null:
		textBox = playerRef.get_node("DialogueBox/TextContent")

func displayBox():
	playerRef.get_node("DialogueBox").show()

func closeBox():
	playerRef.get_node("DialogueBox").hide()

func display_stone1():
	getRefOfDialogue()
	textBox.text = (stoneTablet1_content)  
	displayBox()

func display_stone2():
	getRefOfDialogue()
	textBox.text = (stoneTablet2_content)  
	displayBox()

func display_stone3():
	getRefOfDialogue()
	textBox.text = (stoneTablet3_content)   
	displayBox()

func display_diary():
	getRefOfDialogue()
	textBox.text = (diary_content)  
	displayBox()

func setPlayerRef(node: Node):
	playerRef = node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
