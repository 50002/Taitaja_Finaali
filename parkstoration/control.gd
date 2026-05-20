extends Control

func _ready() -> void:
	$Button.grab_focus()


func _on_button_pressed() -> void:
	$AudioStreamPlayer.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://Menu/Mainmenu.tscn")
