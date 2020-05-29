extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player
var spawn
var agua

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("Player/Player")
	spawn = get_node("spawn").translation
	agua = get_node("Spatial/uagua/AnimationPlayer").play("New Anim")
	
	
func _input(event):
	if Input.is_action_pressed("resetar"):
		player.translation = spawn
		print("asd")

