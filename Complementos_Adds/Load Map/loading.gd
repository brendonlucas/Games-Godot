extends Spatial

func _on_Switch_pressed():
	$CanvasLayer/Switch.hide()
	background_load.load_scene("res://paintings.tscn")

