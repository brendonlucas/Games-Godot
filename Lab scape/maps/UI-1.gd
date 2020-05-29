extends Control

var audio_theme

func _ready():
	audio_theme = get_node("BG_Music/Audio_theme")

func _on_Audio_theme_finished():
	audio_theme.play()
