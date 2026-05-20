extends Node2D
var Player_in_range : bool = false
var pos
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Player_in_range and (Input.is_action_just_pressed("INTERACTION") or Input.is_action_just_pressed("C_INTERACT") or Input.is_action_just_pressed("CI2")):
		GameManager.TrasH_Left -= 1
		queue_free()
		$AudioStreamPlayer.play()



		





func _on_collection_area_area_entered(area: Area2D) -> void:
	if area.name == "Interaction":
		Player_in_range = true


func _on_collection_area_area_exited(area: Area2D) -> void:
	if area.name == "Interaction":

		Player_in_range = false
