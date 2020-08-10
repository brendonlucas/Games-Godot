extends KinematicBody


var distance = 0
var timer_move
var velocity = Vector3()
var parado = false


export var speed : float = 10
export var acceleration : float = 5
export var air_acceleration : float = 10

func _ready():
	timer_move = $Timer
	timer_move.start()

func _process(delta):
	
	if timer_move.time_left == 0:
		parado = true

	var direction = Vector3()
	if !parado:
		direction.y += 1
		
	direction *= speed
	direction = move_and_slide(direction, Vector3(0, 1, 0))
		
func aceell(delta):
	var direction = Vector3()
	direction += transform.basis.y
	direction = direction.normalized()
	var accel = acceleration if is_on_floor() else air_acceleration
	velocity = velocity.linear_interpolate(direction * speed, accel * delta)
	velocity = move_and_slide(velocity, Vector3.UP)
		
