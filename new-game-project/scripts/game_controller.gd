extends Node


var package_collected: bool = false
var asteroid_collected: bool = false

func asteroid_collect(value: bool):
	asteroid_collected = true
	EventController.emit_signal("asteroid_collected", asteroid_collected)

func package_collect(value: bool):
	package_collected = true
	EventController.emit_signal("package_collected", package_collected)
	
func package_return(value: bool):
	package_collected = false
	EventController.emit_signal("package_returned", package_collected)
