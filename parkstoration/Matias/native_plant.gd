extends Node2D

@onready var can_2: Sprite2D = $Sprite2D2
@onready var sprite_2d: Sprite2D = $Sprite2D

var Player_in_range : bool = false
var pos 
var state : int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Player_in_range and (Input.is_action_just_pressed("INTERACTION") or Input.is_action_just_pressed("C_INTERACT") or Input.is_action_just_pressed("CI2")):
		state = 0
		sprite_2d.modulate = Color.WHITE
		can_2.visible = false


func _on_collection_area_area_entered(area: Area2D) -> void:
		if area.name == "Interaction":
			Player_in_range = true


func _on_collection_area_area_exited(area: Area2D) -> void:
	if area.name == "Interaction":
		Player_in_range = false


func _on_timer_timeout() -> void:
	if GameManager.Tasks["Replace Invasive flowers with native ones"] == false:
		state += 1
		match state:
			1:
				sprite_2d.modulate = Color.SADDLE_BROWN
				can_2.visible = true
			2: 
				get_parent().Delete(self)
