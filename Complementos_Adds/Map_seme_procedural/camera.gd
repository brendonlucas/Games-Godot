extends KinematicBody

var velocity = Vector3()

export var speed : float = 5
export var acceleration : float = 5
export var air_acceleration : float = 10

func _ready():
	pass

func _process(delta):
	var direction = Vector3()
	direction.x += 1
	direction *= speed
	direction = move_and_slide(direction, Vector3(0, 1, 0))
		
