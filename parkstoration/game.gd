extends Node2D


var keyboard = preload("res://Matias/Player.tscn")
var controller1 = preload("res://Matias/Controller_Player.tscn")
var controller2 = preload("res://Matias/Controller_Player2.tscn")
@onready var ui: CanvasLayer = $CanvasLayer
@onready var players: Node = $players

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ui.fail.connect(Fail)
	if not GameManager.Two_Controllers:
		var player = keyboard.instantiate()
		player.global_position = Vector2(280.0, 280.0)
		player.Role = 0
		players.add_child(player)
		player = controller1.instantiate()
		player.global_position = Vector2(300.0, 280.0)
		player.Role = 1
		players.add_child(player)
	else:
		var player = controller1.instantiate()
		player.global_position = Vector2(260.0, 280.0)
		player.Role = 0
		players.add_child(player)
		player = controller2.instantiate()
		player.global_position = Vector2(320.0, 280.0)
		player.Role = 1
		players.add_child(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.Tasks == {"Pick up trash": true, "Replace Invasive flowers with native ones": true, "Fix the shelter": true, "Fully unblock the forest path": true}:
		get_tree().change_scene_to_file("res://Menu/win.tscn")
	

func Fail() -> void:
	get_tree().change_scene_to_file("res://Menu/lose.tscn")
