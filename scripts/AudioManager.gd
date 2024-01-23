extends Node

var num_players = 8
var bus = "master"

var available = []  # The available players.
var queue = []  # The queue of sounds to play.

var soundPath = "res://assets/audio/sounds/"
var dieSound = "die/die.mp3"
var hurtSounds = [
	"hurt/hurt2.mp3",
	"hurt/hurt3.mp3"
]
var pickSounds = [
	"pick/pick1.mp3",
	"pick/pick2.mp3",
	"pick/pick3.mp3",
	"pick/pick4.mp3"
]
var swordSounds = [
	"sword_hit1.mp3",
	"sword_hit2.mp3",
	"sword_void1.mp3",
	"sword_void2.mp3"
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

func play(sound_path):
	queue.append(sound_path)

func playDieSound():
	play(soundPath + dieSound)

func playHurtSound():
	play(soundPath + hurtSounds[randi() % hurtSounds.size()])

func playPickSound():
	play(soundPath + pickSounds[randi() % pickSounds.size()])

func playSwordSound():
	play(soundPath + swordSounds[randi() % swordSounds.size()])

func _process(delta):
	# Play a queued sound if any players are available.
	if not queue.is_empty() and not available.is_empty():
		available[0].stream = load(queue.pop_front())
		available[0].play()
		available.pop_front()
