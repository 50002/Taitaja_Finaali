extends CanvasLayer
@onready var tx: RichTextLabel = $RichTextLabel

@onready var Forest_Unlock: CheckBox = $Control/VBoxContainer/CheckBox4
@onready var trash: CheckBox = $Control/VBoxContainer/CheckBox
@onready var flowerts: CheckBox = $Control/VBoxContainer/CheckBox2
@onready var shelter: CheckBox = $Control/VBoxContainer/CheckBox3
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var label: Label = $ProgressBar/Label

signal fail

var min : int = 2
var sec : int = 00
var time : int = 120
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	label.text = str("Forest health: ", completed()/4*100, "%")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.Tasks["Fully unblock the forest path"] == true:
		Forest_Unlock.button_pressed = true
		label.text = str("Forest health: ", int(float(completed())/4*100), "%")
	if GameManager.Tasks["Pick up trash"] == true:
		trash.button_pressed = true
		label.text = str("Forest health: ", int(float(completed())/4*100), "%")
	if GameManager.Tasks["Replace Invasive flowers with native ones"] == true:
		flowerts.button_pressed = true
		label.text = str("Forest health: ", int(float(completed())/4*100), "%")
	if GameManager.Tasks["Fix the shelter"] == true:
		shelter.button_pressed = true
		label.text = str("Forest health: ", int(float(completed())/4*100), "%")


func _on_timer_timeout() -> void:
	time -= 1
	min = floor(time/60)
	sec = max(time-60*min, 0)
	print(min," ", sec)
	if min == 0 and sec == 0:
		fail.emit()
	if sec > 9:
		tx.text = str(min, " : ", sec)
	else:
		tx.text = str(min, " : 0", sec)
	

func completed():
	var count: int = 0
	for i in GameManager.Tasks:
		if GameManager.Tasks[i] == true:
			count += 1
	progress_bar.value = count
	return count
	
	
	
	
	
	
	
