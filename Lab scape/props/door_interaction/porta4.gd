extends Interactable

var dor
var open = false
var audio_open
var audio_close
var current_anima

var timer
var player

var acess_denied_sonds

func _ready():
	dor = get_parent().get_node("pistal/AnimationPlayer")
	timer = get_parent().get_node("Timer")
	player = get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Player")
	acess_denied_sonds = get_parent().get_node("acesse")

func get_interactable_text():
	return "Entrar com Cartão de acesso Amarelo"
	
func interact():
	if timer.time_left == 0:
		if open and player.get_card("yellow"):
			dor.play("fechar")
			open = false
			
		elif !open and player.get_card("yellow"):
			dor.play("abrir")
			open = true
		else:
			acess_denied_sonds.play()
			
		timer.start()
