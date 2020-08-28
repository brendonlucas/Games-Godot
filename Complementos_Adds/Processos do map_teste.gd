extends Spatial

var game = preload("res://Teste 3d in 2d in 3d/map 2.tscn")
var drop_game_test = 0

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("coisar") and drop_game_test == 0:
		instancia_objetos()
		drop_game_test = 1
	elif Input.is_action_just_pressed("coisar") and drop_game_test == 1:
		var game_teste = get_node("map 2")
		game_teste.queue_free()
		drop_game_test = 0

func instancia_objetos():
	var clone = game.instance()
	var scene_root = get_tree().root.get_children()[0]
	scene_root.add_child(clone)
	#clone.translation = novo_lugar
	
	
func printar():
	#print("Coisou o coisa")
	pass
