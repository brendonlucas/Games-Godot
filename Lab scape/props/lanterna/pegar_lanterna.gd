extends Interactable

var lanterna
var player

func _ready():
	lanterna = get_parent().get_node(".")
	player = get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Player")

func get_interactable_text():
	return "Lanterna"
	
func interact():
	player.set_lanterna(true)
	lanterna.queue_free()
	pass
