extends Node2D


var locked := false
var player
var Player_in_range : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Player_in_range and Input.is_action_pressed("INTERACTION"):
		if rotation < deg_to_rad(90):
			player.global_position = global_position + Vector2(0, 10)
			rotation = move_toward(rotation, deg_to_rad(90), 10*delta)
	elif locked == false:
		rotation = move_toward(rotation, 0, 10*delta)


func _on_area_2d_area_entered(area: Area2D) -> void:
	player = area.get_parent()
	if area.name == "Interaction":
		Player_in_range = true



func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "Interaction":
		Player_in_range = false
