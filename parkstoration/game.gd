extends Node2D


var keyboard = preload("res://Matias/Player.tscn")
var controller1 = preload("res://Matias/Controller_Player.tscn")
var controller2 = preload("res://Matias/Controller_Player2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not GameManager.Two_Controllers:
		var player = keyboard.instantiate()
		player.global_position = Vector2(280.0, 280.0)
		player.Role = 0
		add_child(player)
		player = controller1.instantiate()
		player.global_position = Vector2(300.0, 280.0)
		player.Role = 1
		add_child(player)
	else:
		var player = controller1.instantiate()
		player.global_position = Vector2(280.0, 280.0)
		player.Role = 0
		add_child(player)
		player = controller2.instantiate()
		player.global_position = Vector2(300.0, 280.0)
		player.Role = 1
		add_child(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
