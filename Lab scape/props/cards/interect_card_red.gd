extends Interactable

var dor
var player
var acess_denied_sonds
var card


func _ready():
	player = get_parent().get_parent().get_parent().get_node("Player")
	card = get_parent().get_node(".")
	
func get_interactable_text():
	if card.name == "card_red":
		return "Cartão de acesso Vermelho"
	elif card.name == "card_yellow":
		return "Cartão de acesso Amarelo"
	elif card.name == "card_blue":
		return "Cartão de acesso Azul"
	elif card.name == "card_green":
		return "Cartão de acesso Verde"
	elif card.name == "card_preto":
		return "Cartão de acesso Preto"
	elif card.name == "computador":
		return "Conceder acesso à saida"
	
func interact():
	player.set_pegou_card(card.name)
	card.queue_free()
