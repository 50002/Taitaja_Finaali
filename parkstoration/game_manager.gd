extends Node

var TrasH_Left : int = 10

var Two_Controllers : bool = false

var Has_Tools : bool = false

var Tasks : Dictionary = {
	"Pick up trash": false,
	"Replace Invasive flowers with native ones": false,
	"Fix the shelter": false,
	"Fully unblock the forest path": false
}

func Reset() -> void:
	TrasH_Left = 10
	Has_Tools = false
	for task in Tasks:
		Tasks[task] = false
