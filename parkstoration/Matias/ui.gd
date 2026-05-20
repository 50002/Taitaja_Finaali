extends CanvasLayer
@onready var tx: RichTextLabel = $RichTextLabel

@onready var Forest_Unlock: CheckBox = $Control/VBoxContainer/CheckBox4
@onready var trash: CheckBox = $Control/VBoxContainer/CheckBox
@onready var flowerts: CheckBox = $Control/VBoxContainer/CheckBox2
@onready var shelter: CheckBox = $Control/VBoxContainer/CheckBox3


var min : int = 2
var sec : int = 00
var time : int = 120
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.Tasks["Fully unblock the forest path"] == true:
		Forest_Unlock.button_pressed = true
	if GameManager.Tasks["Pick up trash"] == true:
		trash.button_pressed = true
	if GameManager.Tasks["Replace Invasive flowers with native ones"] == true:
		flowerts.button_pressed = true
	if GameManager.Tasks["Fix the shelter"] == true:
		shelter.button_pressed = true


func _on_timer_timeout() -> void:
	time -= 1
	min = floor(time/60)
	sec = max(time-60*min, 0)
	print(min," ", sec)
	if sec > 9:
		tx.text = str(min, " : ", sec)
	else:
		tx.text = str(min, " : 0", sec)
	
