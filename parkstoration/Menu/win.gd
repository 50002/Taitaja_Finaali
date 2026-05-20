extends Control


func _ready() -> void:
	$ColorRect/VBoxContainer/Button.grab_focus()
	



func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Menu/Mainmenu.tscn")


func _on_button_pressed() -> void:
	$pick.play()
	$Timer.start()
