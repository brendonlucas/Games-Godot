extends Spatial
const H_LOOK_SENS = 0.6
const V_LOOK_SENS = 0.4

var player
onready var cam = $"."

func _ready():
	pass # Replace with function body.


func _process(delta):
	player = get_parent().get_node("Player")
	translation = player.translation
	
