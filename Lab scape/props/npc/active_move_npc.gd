extends Area

var player
var tocou
var anim_npc
var audio_effect

func _ready():
	player = get_parent().get_parent().get_parent().get_node("Player")
	anim_npc = get_parent().get_node("npcs/AnimationPlayer") 
	audio_effect = get_parent().get_parent().get_parent().get_node("UI/BG_Music/Audio_effect_2")

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" and tocou != true:
			tocou = true
			anim_npc.play("jogado")
			audio_effect.play()
			queue_free()
			
