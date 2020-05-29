extends Area

var player
var tocou
var soda
var audio_soda
var porta_sala

func _ready():
	soda = get_parent().get_node("soda/AnimationPlayer")
	audio_soda = get_parent().get_node("soda/Audio_drop")
	porta_sala = get_parent().get_parent().get_node("sala3/porta/porta/pistal/AnimationPlayer")
	
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" and tocou != true:
			tocou = true
			porta_sala.play("abrir")
			soda.play("drop")
			audio_soda.play()
			queue_free()
			
