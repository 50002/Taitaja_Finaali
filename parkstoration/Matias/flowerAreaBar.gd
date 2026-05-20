extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.Tasks["Pick up trash"] == true and GameManager.Tasks["Replace Invasive flowers with native ones"] == true:
		value = 2
	elif GameManager.Tasks["Pick up trash"] == true or GameManager.Tasks["Replace Invasive flowers with native ones"] == true:
		value = 1
