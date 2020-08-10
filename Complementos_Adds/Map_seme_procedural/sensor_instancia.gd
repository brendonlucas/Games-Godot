extends Area

var camera
var tocou


func _ready():
	camera = get_tree().root.get_node("Map")
	
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "camera" and tocou != true:
			camera.instancia_objetos()
			tocou = true
			queue_free()
			
