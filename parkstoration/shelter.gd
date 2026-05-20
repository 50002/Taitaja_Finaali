extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var static_body_2d: StaticBody2D = $StaticBody2D
@onready var sprite_2d_2: Sprite2D = $Sprite2D2

var Player_in_range : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		if Player_in_range and (Input.is_action_just_pressed("INTERACTION") or Input.is_action_just_pressed("C_INTERACT") or Input.is_action_just_pressed("CI2")):
			if GameManager.Has_Tools == true:
				sprite_2d_2.visible = true
				if sprite_2d.visible == true:
					$AudioStreamPlayer.play()
					for i in range(2):
						await get_tree().create_timer(0.33).timeout
						$AudioStreamPlayer.play()
				sprite_2d_2.visible = true
				sprite_2d.visible = false
				GameManager.Tasks["Fix the shelter"] = true
				
				


func _on_area_2d_area_entered(area: Area2D) -> void:
		if area.name == "Interaction":
			if area.get_collision_layer_value(15) == true:
				Player_in_range = true


func _on_area_2d_area_exited(area: Area2D) -> void:
		if area.name == "Interaction":
			if area.get_collision_layer_value(15) == true:
				Player_in_range = true
