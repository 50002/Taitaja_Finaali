extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect/VBoxContainer/Button.grab_focus()


func _on_button_pressed() -> void:
	$pick.play()
	$Timer.start()



func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Menu/Mainmenu.tscn")
