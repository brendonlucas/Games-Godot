extends KinematicBody

export var MOVE_SPEED = 2
var acelerecao = 5
var desaceleracao = 10
export var max_terminal_velocity : float = 54
export var jump_power : float = 5
export var force_gravity : float = 0.98

const GRAVITY = 9.8
var y_velocity : float
var velocity = Vector3()

const H_LOOK_SENS = 0.6
const V_LOOK_SENS = 0.4

var cam
var player
var animation

# var controles
var parando
var correndo
var moviments_active

var y_velo = 0
const MAX_FALL_SPEED = 30

func _ready():
	player = get_node(".")
	animation = get_node("AnimationPlayer")
	player.rotation_degrees.y = 180
	moviments_active = true
	#animation = get_node("AnimationPlayer")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

func _physics_process(delta):
	#cam = get_node("target/Camera").global_transform
	dd(delta)
	
	


func dd(delta):
	cam = get_parent().get_node("target").global_transform
	var dir = Vector3()
	var is_moving = false
	var correndo = false
	MOVE_SPEED = 2
	
		
	if Input.is_action_pressed("frente") and moviments_active:
		dir += -cam.basis[2]
		is_moving = true
		
	if Input.is_action_pressed("tras") and moviments_active:
		dir += cam.basis[2]
		is_moving = true
		
	if Input.is_action_pressed("direita") and moviments_active:
		dir += +cam.basis[0]
		is_moving = true
		
	if Input.is_action_pressed("esquerda") and moviments_active:
		dir += -cam.basis[0]
		is_moving = true
		
	if Input.is_action_pressed("sprint") and moviments_active and is_moving:
		correndo = true
		MOVE_SPEED = 9
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += jump_power
	dir.y = 0
	dir = dir.normalized()
	
	velocity.y -= delta * GRAVITY
	#velocity.y = y_velo
	var hv = velocity
	hv.y = 0
	
	var new_pos = dir * MOVE_SPEED
	var accel = desaceleracao
	
	if (dir.dot(hv) > 0):
		accel = acelerecao
		
	hv = hv.linear_interpolate(new_pos, accel * delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	#velocity.y -= force_gravity
	
	#y_velo -= GRAVITY
	
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
	
		
	if is_moving:
		var angle = atan2(hv.x, hv.z)
		var character_rot = player.get_rotation()
		character_rot.y = angle
		player.set_rotation(character_rot)
		
		
	if is_moving and !correndo:
		$AnimationPlayer.play("walk")
	elif !is_moving and !correndo:
		animation.play("idle")
	if correndo:
		animation.play("run")
		
		
func block_moviments(option):
	if option == true:
		moviments_active = option
	elif option == false:
		moviments_active = option
		
		
		
		
		
		
		
func gg(delta):
	var dir = Vector3()
	var is_moving = false
	parando = false

	if is_moving and false:
		animation.play("run")
		correndo = true
		
		#code rotacao
		
	if !is_moving and correndo and false:
		animation.play("stop run")
		correndo = false
