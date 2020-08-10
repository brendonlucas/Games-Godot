extends Control

var scene_path_sair
var scene_change
var menu_pause_active = false
var menu_2_active = false


func _ready():
	pass
	#for button in $Menu_1/buttons.get_children():
		#button.connect("pressed", self, "_on_Button_pressed", "res://Menu_pausa/teste.tscn")

func _input(event):
	if Input.is_action_just_pressed("menu_pause"):
		if menu_pause_active:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			menu_pause_active = false
			menu_2_active = false
			$Menu_2.hide()
			hide()
			
		elif !menu_pause_active:
			menu_pause_active = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			show()
		
func _on_Button_sair_pressed():
	scene_change = "res://Menu_pausa/teste.tscn"
	$FadeIn.show()
	$FadeIn.fade_in()
	

func _on_Button_opcoes_pressed():
	if menu_2_active:
		menu_2_active = false
		$Menu_2.hide()
	elif !menu_2_active:
		menu_2_active = true
		$Menu_2.show()


func _on_Button_continuar_pressed():
	menu_pause_active = false
	menu_2_active = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Menu_2.hide()
	hide()


func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_change)


