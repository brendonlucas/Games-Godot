extends Control

var player
var spawn
var apertou = false
var timer

func _ready():
	player = get_parent().get_node("Player")
	spawn = get_parent().get_node("spawn").translation
	timer = get_node("Timer")
	

func _process(delta):
	if apertou and timer.time_left == 0:
		player.translation = spawn
		player.rotate_y(-90)
		player.set_moviments(true)
		queue_free()
		
func _on_Button_iniciar_pressed():
	if !apertou:
		timer.start()
		apertou = true
		
