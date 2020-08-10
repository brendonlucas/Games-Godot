extends Spatial

var local_spawn = 0
var timer
var bloco = preload("res://Map_seme_procedural/Block.tscn")
var new_sensor = preload("res://Map_seme_procedural/sensor_instancia.tscn")
var pilar = preload("res://Map_seme_procedural/Pilar.tscn")

var novo_lugar = Vector3(0,0,0)
var lugar_pilar_1 = Vector3(15, -80, 10)
var lugar_pilar_2 = Vector3(15, -80, -10)
var lugar_pilar_3 = Vector3(15, -40, 30)

func _ready():
	timer = $Timer
	timer.start()
	
func _process(delta):
	pass
	#if timer.time_left == 0:
	#	var clone = bloco.instance()
	#	var scene_root = get_tree().root.get_children()[0]
	#	scene_root.add_child(clone)
	#	novo_lugar.x += 5
	#	clone.translation = novo_lugar
	#	timer.start()

func instancia_objetos():
	
	
	var clone = bloco.instance()
	var clone_sensor = new_sensor.instance()
	var clone_pilar = pilar.instance()
	var clone_pilar2 = pilar.instance()
	var scene_root = get_tree().root.get_children()[0]
	scene_root.add_child(clone)
	scene_root.add_child(clone_sensor)
	scene_root.add_child(clone_pilar)
	scene_root.add_child(clone_pilar2)
	lugar_pilar_1.x += 15
	lugar_pilar_2.x += 15
	lugar_pilar_1.z = randomNumber()
	lugar_pilar_2.z = -randomNumber()
	
	novo_lugar.x += 5
	clone.translation = novo_lugar
	clone_sensor.translation = novo_lugar
	clone_pilar.translation = lugar_pilar_1
	clone_pilar2.translation = lugar_pilar_2
	

func randomNumber():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randi_range(10, 40)
	return my_random_number
