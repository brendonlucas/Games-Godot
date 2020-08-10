extends Spatial

var player
var change_rot_active = false
export(float, 0.1, 1) var mouse_sensitivity : float = 0.3
export(float, -90, 0) var min_pitch : float = -90
export(float, 0, 90) var max_pitch : float = 90

func _ready():
	pass
	
func _input(event):
	var is_moving = false
	
	if Input.is_action_pressed("frente"):
		is_moving = true
		
	if Input.is_action_pressed("tras"):
		is_moving = true
		
	if Input.is_action_pressed("esquerda"):
		is_moving = true
	
	if Input.is_action_pressed("direita"):
		is_moving = true
	
	
			
	if event is InputEventMouseMotion and is_moving:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		$".".rotation_degrees.x -= event.relative.y * mouse_sensitivity
		$".".rotation_degrees.x = clamp($".".rotation_degrees.x, min_pitch, max_pitch)
	
		
	if event is InputEventMouseMotion and !is_moving:
		change_rot_active = true
		$".".rotation_degrees.y -= event.relative.x * mouse_sensitivity
		$".".rotation_degrees.x -= event.relative.y * mouse_sensitivity
		$".".rotation_degrees.x = clamp($".".rotation_degrees.x, min_pitch, max_pitch)
	
	
func _process(delta):
	player = get_tree().root.get_node("map_teste/Player_v4")
	translation = player.translation
	
