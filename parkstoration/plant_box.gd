extends Node2D

var a: int=0
@onready var area: CollisionShape2D = $Area2D/CollisionShape2D
var Completed : bool = false
var Flower_List: Array[Node2D] = []
var Player_in_range : bool = false
var bad = preload("res://Matias/invasive_plant.tscn")
var good = preload("res://Matias/native_plant.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#for i in range(10):
		spawn("BAD")
		
func _process(delta: float) -> void:
	if Player_in_range and (Input.is_action_just_pressed("INTERACTION") or Input.is_action_just_pressed("C_INTERACT") or Input.is_action_just_pressed("CI2")):
		if get_child_count() < 18:
			spawn("GOOD")
	
	if Flower_List.filter(func (a):return a.name.contains("GOOD")).size() >= 10:
		Completed = true

func _on_timer_timeout() -> void:
	if Completed == false:
		
		if get_child_count() < 18:
			spawn("BAD")
		else:
			
			Flower_List[-1].queue_free()
			Flower_List.pop_back()
			spawn("BAD")
			


func spawn(type: String) -> void:
	a += 1
	var litter
	var NAME : String
	if type == "BAD":
		litter = bad
		NAME = "BAD"
	else:
		litter = good
		NAME = "GOOD"
	
	
	var positioning = Vector2( randf_range((area.global_position.x-37),(area.global_position.x+37)), randf_range((area.global_position.y-22),(area.global_position.y+22)))
	var trash = litter.instantiate()
	trash.pos = positioning
	trash.name = str( NAME)
	add_child(trash, true)
	if type == "GOOD":
		Flower_List.append(trash)
	else:
		Flower_List.insert(0, trash)
	
	
func Delete(node) -> void:
	var idx = Flower_List.find(node)
	Flower_List.pop_at(idx)
	node.queue_free()
	

func _on_area_2d_area_entered(area: Area2D) -> void:
		if area.name == "Interaction":
			Player_in_range = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "Interaction":
		Player_in_range = false
