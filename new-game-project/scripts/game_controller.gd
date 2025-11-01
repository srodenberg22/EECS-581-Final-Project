extends Node


var collected: bool = false

func package_collected(value: bool):
	collected = true
	EventController.emit_signal("package_collected", collected)
	
func package_returned(value: bool):
	collected = false
	EventController.emit_signal("package_collected", collected)
