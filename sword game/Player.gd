extends KinematicBody

var MOVE_SPEED = 7
var acelerecao = 7
var desaceleracao = 9

const JUMP_FORCE = 15
const GRAVITY = 0.98
const MAX_FALL_SPEED = 30
var y_velo = 0
var velocity = Vector3()

const H_LOOK_SENS = 0.6
const V_LOOK_SENS = 0.4


onready var cam = $target
var animacao

func _ready():
	animacao = get_node("AnimationPlayer")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	
func _input(event):
	
	if event is InputEventMouseMotion:
		cam.rotation_degrees.x -= event.relative.y * -V_LOOK_SENS
		cam.rotation_degrees.x = clamp(cam.rotation_degrees.x, -30, 70)
		rotation_degrees.y -= event.relative.x * H_LOOK_SENS
 

func _physics_process(delta):
	var dir = Vector3()
	var is_moving = false
	var sprint = false
	var move_front = false
	var move_back = false
	var move_left = false
	var move_right = false

	var just_jumped = false
	var grounded = is_on_floor()
	
	
	if Input.is_action_pressed("frente"):
		dir.z += 1
		move_front = true
		is_moving = true
		
	if Input.is_action_pressed("tras"):
		dir.z -= 1
		MOVE_SPEED = 2
		move_back = true
		is_moving = true
		
	if Input.is_action_pressed("direita") :
		dir.x -= 1
		MOVE_SPEED = 5
		move_right = true
		is_moving = true
		
	if Input.is_action_pressed("esquerda"):
		dir.x += 1
		MOVE_SPEED = 5
		move_left = true
		is_moving = true
	
	if Input.is_action_pressed("sprint"):
		sprint = true
		
	if move_front:
		MOVE_SPEED = 7
	#animations
	
		
	if is_moving and move_front and grounded:
		animacao.play("run slow")
	elif !is_moving and grounded:
		animacao.play("idle 1")
	elif is_moving and move_left and grounded:
		animacao.play("walk left")
	elif is_moving and move_right and grounded:
		animacao.play("walk right")
	elif is_moving and move_back and grounded:
		animacao.play("walk back")
		
	
	
	
	
	if grounded and Input.is_action_just_pressed("pulo"):
		is_moving = false
		just_jumped = true
		y_velo = JUMP_FORCE
		animacao.play("jump moving")
		
		
	var hv = dir
	
	var new_pos = dir * MOVE_SPEED
	var accel = desaceleracao
	
	if (dir.dot(hv) > 0):
		accel = acelerecao
		
	hv = hv.linear_interpolate(new_pos, accel * delta)
	
	dir.x = hv.x
	dir.z = hv.z
	
	dir = dir.normalized()
	dir = dir.rotated(Vector3(0, 1, 0), rotation.y)
	dir *= MOVE_SPEED
	dir.y = y_velo
	
	dir = move_and_slide(dir, Vector3(0, 1, 0))
	y_velo -= GRAVITY



	if grounded and y_velo <= 0:
		y_velo = -0.1
	if y_velo < -MAX_FALL_SPEED:
		y_velo = -MAX_FALL_SPEED



