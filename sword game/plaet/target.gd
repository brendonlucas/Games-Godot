extends Spatial

const H_LOOK_SENS = 0.3
const V_LOOK_SENS = 0.4

onready var cam = $"."

func _input(event):
	if event is InputEventMouseMotion:
		cam.rotation_degrees.x -= event.relative.y * -V_LOOK_SENS
		cam.rotation_degrees.x = clamp(cam.rotation_degrees.x, -80, 50)
		rotation_degrees.y -= event.relative.x * H_LOOK_SENS
 
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


#func _process(delta):
#	pass

