extends Control

func _ready():
	pass
var scene_change = "res://dados entre scene/cena 1.tscn"

func _process(delta):
	if Input.is_action_just_pressed("direita"):
		print("cena 2")
		
	if Input.is_action_just_pressed("frente"):
		
		get_tree().change_scene(scene_change)
