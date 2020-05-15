extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player
var spawn

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("Player")
	spawn = get_node("spawn").translation
	
func _input(event):
	if Input.is_action_pressed("resetar"):
		player.translation = spawn

