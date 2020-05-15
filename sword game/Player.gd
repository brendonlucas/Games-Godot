extends KinematicBody
 
var speed = 10
var gravity = -5
var velocity = Vector3()
var character
var acelerecao = 7
var desaceleracao = 9
var camera
var animacao
 
func _ready():
	character = get_node("japa")
	camera = get_node("target/Camera").global_transform
	animacao = get_node("japa/AnimationPlayer")
	
func _physics_process(delta):
	var dir = Vector3()
	var is_moving = false
	
	if Input.is_action_pressed("frente"):
		dir += -camera.basis[2]
		is_moving = true
	if Input.is_action_pressed("tras"):
		dir += +camera.basis[2]
		is_moving = true
	if Input.is_action_pressed("esquerda"):
		dir += -camera.basis[0]
		is_moving = true
	if Input.is_action_pressed("direita"):
		dir += camera.basis[0]
		is_moving = true
	
	if is_moving:
		animacao.play("Run")
	else:
		animacao.play("guardar")
		
	dir.y = 0
	dir = dir.normalized()
	
	velocity.y += delta * gravity
	
	var hv = velocity
	hv.y = 0
	
	var new_pos = dir * speed
	var accel = desaceleracao
	
	if (dir.dot(hv) > 0):
		accel = acelerecao
	
	hv = hv.linear_interpolate(new_pos, accel * delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
   
	# Your Code
	if is_moving:
		var angle = atan2(hv.x, hv.z)  
		var char_rot = character.get_rotation()   
		char_rot.y = angle   
		character.set_rotation(char_rot)
	   
	
