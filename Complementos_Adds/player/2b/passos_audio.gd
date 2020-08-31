extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var passo1 = preload("res://audio/passo1.wav")
var passo2 = preload("res://audio/passo2.wav")
var passo3 = preload("res://audio/passo3.wav")
var audio

# Called when the node enters the scene tree for the first time.
func _ready():
	audio = get_parent().get_node("passos_audio")

func play_passos():

	var numero_aleatorio = randomNumber()
	
	
	#audio.play()


func randomNumber():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randi_range(1, 3)
	return my_random_number


	
	
func _process(delta):
	if Input.is_action_pressed("menu_pause"):
		pass

