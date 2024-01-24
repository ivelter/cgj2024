extends Node

var num_players = 8
var bus = "master"
var p1 = null
var p2 = null

var available = []  # The available players.
var queue = []  # The queue of sounds to play.

var music1Path = "res://assets/audio/musics/festin.wav"
var music2Path = "res://assets/audio/musics/Le destin d'alquimé.mp3"

var musics = [
	music1Path,
	music2Path
]

var soundPath = "res://assets/audio/sounds/"
var dieSound = "die/die.mp3"
var hurtSounds = [
	"hurt/hurt1.mp3",
	"hurt/hurt2.mp3",
	"hurt/hurt3.mp3",
	"hurt/hurt4.mp3"
]
var pickSounds = [
	"pick/pick1.mp3",
	"pick/pick2.mp3",
	"pick/pick3.mp3",
	"pick/pick4.mp3"
]
var swordSounds = [
	"sword/sword_hit1.mp3",
	"sword/sword_hit2.mp3",
	"sword/sword_void1.mp3",
	"sword/sword_void2.mp3"
]

func _ready():
	# Create the pool of AudioStreamPlayer nodes.
	for i in num_players:
		var p = AudioStreamPlayer.new()
		add_child(p)
		available.append(p)
		p.finished.connect(_on_stream_finished.bind(p))
		p.bus = bus

func _on_stream_finished(stream):
	# When finished playing a stream, make the player available again.
	available.append(stream)

func play(sound_path,once):
	if(once):
		p1 = AudioStreamPlayer.new()
		add_child(p1)
		p1.bus = bus
		p1.stream = load(sound_path)
		p1.play()
		
	else:
		queue.append(sound_path)
		
	

func playDieSound():
	play(soundPath + dieSound,true)

func playHurtSound():
	play(soundPath + hurtSounds[randi() % hurtSounds.size()],true)

func playPickSound():
	play(soundPath + pickSounds[randi() % pickSounds.size()],true)

func playSwordSound():
	
	play(soundPath + swordSounds[randi() % swordSounds.size()],true)
	
func playMusic1():
	play(music1Path,false)
	
func pauseMusic():
	p2.stop()

	
func playMusic2():
	play(music2Path,false)
	
func randMusic():
	play(musics[randi() % musics.size()],false)

func _process(delta):
	# Play a queued sound if any players are available.
	if not queue.is_empty() and not available.is_empty():
		available[0].stream = load(queue.pop_front())
		available[0].play()
		p2 = available[0]
		available.pop_front()
