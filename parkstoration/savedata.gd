extends Node

var config = ConfigFile.new()
var BGM = 0


func _ready() -> void:

	update_volume()

func update_volume():
	for volume in config.get_sections():
		BGM = config.get_value(volume, "BGM")
		
	var bgm_index= AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bgm_index, BGM)

func save_volume():
	config.set_value("Volume", "BGM", BGM)
	
	config.save("user://savedata.cfg")

#ASDF
