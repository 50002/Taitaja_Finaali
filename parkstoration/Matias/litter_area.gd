extends Node2D
@onready var area: CollisionShape2D = $Area2D/CollisionShape2D

var litter = preload("res://Matias/litter.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for i in range(10):
		var positioning = Vector2( randf_range((area.global_position.x-150),(area.global_position.x+150)), randf_range((area.global_position.y-50),(area.global_position.y+50)))
		var trash = litter.instantiate()
		trash.pos = positioning
		add_child(trash)
		
		
func _process(delta: float) -> void:
	if GameManager.TrasH_Left <= 0:
		GameManager.Tasks["Pick up trash"] = true
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
