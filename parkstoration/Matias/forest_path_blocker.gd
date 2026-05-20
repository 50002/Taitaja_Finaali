extends Node2D
@onready var collision_shape_2d: CollisionShape2D = $Sprite2D/RigidBody2D/CollisionShape2D
@onready var body: CharacterBody2D = $Sprite2D/RigidBody2D
@onready var area_2d: Area2D = $Sprite2D/Area2D

signal tools

var Builder_in_area : bool= false
var locked := false
var player
var Player_in_range : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await tools
	area_2d.set_collision_layer_value(15, true)
	area_2d.set_collision_mask_value(15, true)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(Builder_in_area)
	if GameManager.Has_Tools == true:
		tools.emit()
		
		
	if Player_in_range and (Input.is_action_pressed("INTERACTION") or Input.is_action_pressed("C_INTERACT") or Input.is_action_pressed("CI2")):
		player.global_position = global_position + Vector2(0, 10)
		player.velocity = Vector2.ZERO
		if rotation < deg_to_rad(90):
			rotation = move_toward(rotation, deg_to_rad(90), 10*delta)
		else:
			if GameManager.Has_Tools == true:
				if Builder_in_area:
					collision_shape_2d.disabled = true
					$Sprite2D.visible = false
					$Node2D.visible = true
					$Sprite2D/Area2D/CollisionShape2D.disabled = true
					GameManager.Tasks["Fully unblock the forest path"] = true
	elif locked == false:
		rotation = move_toward(rotation, 0, 10*delta)
		


func _on_area_2d_area_entered(area: Area2D) -> void:
	
	if area.get_collision_layer_value(15) == true:
		Builder_in_area = true
	player = area.get_parent()
	if area.name == "Interaction":
		Player_in_range = true



func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.get_collision_layer_value(15) == true:
		Builder_in_area = false
	if area.name == "Interaction":
		Player_in_range = false
