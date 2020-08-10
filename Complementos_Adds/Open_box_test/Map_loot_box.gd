extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bloco = preload("res://Camera.tscn")
var clone = bloco.instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	var scene_root = get_tree().root.get_children()[0]
	scene_root.add_child(clone)
	clone.translation = Vector3(0, 2.84, 8.083)


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		var a  = get_node("Camera")
		a.queue_free()
		var clone2 = bloco.instance()
		var scene_root = get_tree().root.get_children()[0]
		scene_root.add_child(clone2)
		
		clone2.translation = Vector3(0, 2.84, 20)
		
