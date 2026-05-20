extends Control
@onready var move: AudioStreamPlayer = $move
@onready var pick: AudioStreamPlayer = $pick
@onready var back_timer: Timer = $back_timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect/Container/VBoxContainer/bgm.grab_focus()
	Savedata.update_volume()
	$ColorRect/Container/VBoxContainer/bgm.value = Savedata.BGM




func _on_bgm_drag_ended(value_changed: bool) -> void:
	pick.play()


func _on_sfx_drag_ended(value_changed: bool) -> void:
	pick.play()


func _on_back_pressed() -> void:
	pick.play()
	back_timer.start()


func _on_bgm_focus_exited() -> void:
	move.play()


func _on_sfx_focus_exited() -> void:
	move.play()


func _on_back_focus_exited() -> void:
	move.play()


func _on_back_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Menu/Mainmenu.tscn")


func _on_bgm_value_changed(value: float) -> void:
	Savedata.BGM = $ColorRect/Container/VBoxContainer/bgm.value
	Savedata.save_volume()
	Savedata.update_volume()
