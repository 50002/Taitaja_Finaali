extends Control
@onready var move: AudioStreamPlayer = $move
@onready var pick: AudioStreamPlayer = $pick

@onready var start_timer: Timer = $start_timer
@onready var options_timer: Timer = $options_timer
@onready var quit_timer: Timer = $quit_timer

func _ready() -> void:
	$ColorRect/Container/VBoxContainer/start.grab_focus()



func _on_start_pressed() -> void:
	GameManager.Reset()
	pick.play()
	start_timer.start()

func _on_options_pressed() -> void:
	pick.play()
	options_timer.start()


func _on_quit_pressed() -> void:
	pick.play()
	get_tree().quit()


func _on_start_focus_exited() -> void:
	move.play()


func _on_options_focus_exited() -> void:
	move.play()


func _on_quit_focus_exited() -> void:
	move.play()


func _on_options_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Menu/Options.tscn")


func _on_start_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Menu/load_screen.tscn")


func _on_tutorial_pressed() -> void:
	pick.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://Matias/control.tscn")


func _on_tutorial_focus_exited() -> void:
	move.play()
