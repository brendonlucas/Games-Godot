extends Spatial

var luz

func _ready():
	luz = get_node("AnimationPlayer")
	luz.play("piscar")
