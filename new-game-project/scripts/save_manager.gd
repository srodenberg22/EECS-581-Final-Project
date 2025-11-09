extends Node

const SAVE_PATH := "user://savegame.save"

var save_data = {
	"player_position": Vector2.ZERO,
	"package_collected": false,
	"asteroid_collected": false
}

func save_game(home_base_pos: Vector2, package_collected: bool, asteroid_collected: bool) -> void:
	save_data["player_position"] = home_base_pos
	save_data["package_collected"] = package_collected
	save_data["asteroid_collected"] = asteroid_collected
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_var(save_data) 
		file.close()
		print("Game saved!")
	else:
		print("Failed to save game.")

func load_game() -> Dictionary:
	if not FileAccess.file_exists(SAVE_PATH):
		print("No save file found.")
		return save_data
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		var data = file.get_var()
		file.close()
		print("Save loaded.")
		return data
	else:
		print("Failed to load save file.")
		return save_data
