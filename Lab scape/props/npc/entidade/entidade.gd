extends Spatial

var time_surgir
var time_sumir
var time_end
var novo_local
var ativo = false
var surgiu = false
var sumiu = false
var tela_fim

func _ready():
	time_sumir = get_node("Timer_sumir")
	time_surgir = get_node("Timer_aparecer")
	time_end = get_node("Timer_end")
	novo_local = get_parent().get_node("novo_local")
	tela_fim = get_parent().get_parent().get_parent().get_node("UI/UI-final")

func start_times():
	time_sumir.start()
	time_surgir.start()
	time_end.start()
	ativo = true
	show()

func _process(delta):
	if time_sumir.time_left == 0 and ativo and !sumiu:
		hide()
		sumiu = true
		translation = novo_local.translation
	elif time_surgir.time_left == 0 and ativo and !surgiu:
		show()
		surgiu = true
	elif time_end.time_left == 0 and ativo and surgiu:
		tela_fim.show()
