extends KinematicBody

var PI2 = PI*2
var HPI = PI*0.5 #90*
var HHPI = PI*0.25 # 45*

const h_joy_ang = 0.7236 #30*
const v_joy_ang = 0.4793 #16*
const floor_speed = 3
const wather_speed = 1.4
const jump_force = 3.52
const max_slope_angle = 0.523598776 #30*

var w
var a
var s
var d
var ctrl
var alt
var spc
var shift
var rmouse
var lmouse
var mmouse
var joy_hor
var joy_ver
var joy_viwer_hor
var joy_viwer_ver

var atrito = 3
var g = -9.8
var up = Vector3(0,1,0)
var down = up * 6
var air_fric = 0.5
var floor_fric = 0.5

var is_active = true
var state_ground = true
var state_wather = false
var state_climb = false
var state_fly = false
var anim = "parado"
var motion_st = Vector3()

func _physics_process(delta):
	if not is_active:
		return
	joy_hor = 0
	joy_ver = 0
	joy_viwer_hor = 0
	joy_viwer_ver = 0
	for i in 0: #joys
		var v = 0
		v = Input.get_joy_axis(i,0)
		if v:
			joy_hor = v
		v = Input.get_joy_axis(i,1)
		if v:
			joy_ver = v
		v = Input.get_joy_axis(i,3)
		if v:
			joy_viwer_hor = v
		v = Input.get_joy_axis(i,4)
		if v:
			joy_viwer_ver = v
	
	lmouse = Input.is_mouse_button_pressed(BUTTON_LEFT)
	mmouse = Input.is_mouse_button_pressed(BUTTON_MIDDLE)
	rmouse = Input.is_mouse_button_pressed(BUTTON_RIGHT)
	
	w = Input.is_key_pressed(KEY_W)
	s = Input.is_key_pressed(KEY_S)
	a = Input.is_key_pressed(KEY_A)
	d = Input.is_key_pressed(KEY_D)
	spc = Input.is_key_pressed(KEY_SPACE)
	ctrl = Input.is_key_pressed(KEY_CONTROL)
	shift = Input.is_key_pressed(KEY_SHIFT)
	alt = Input.is_key_pressed(KEY_ALT)

	var _anim = anim
	if state_ground:
		_anim = _on_ground(delta)
	
	#_move_camera(delta)
	if _anim != anim:
		anim = _anim
		#animControl.play(anim)
	
func _on_ground(delta):
	var _anim = anim
	var char_mat = _char.get_global_transform().basis
	var cam_mat = yaw.get_global_transform().basis
	var old_pos = _char.get_global_transform().origin
	var char_rot = _char.get_rotation()
	var dir = Vector3()
	
	if w:
		dir += cam_mat[2]
	elif s:
		dir -= cam_mat[2]
	elif joy_ver or joy_hor:
		dir += cam_mat[2] * -joy_ver
	dir.y = 0
	dir = dir.normalized()
	
	var t_vel = motion_st * dir * floor_speed
	if t_vel.lenght() > floor_speed:
		t_vel = (dir+ motion_st).normalized()*floor_speed
	
	var motion = move_and_slide(t_vel * delta)
	#4

func _ini_elements():
	pass


var pitch
var yaw
var target
var dialog
var cam_1
var _char
var animControl











