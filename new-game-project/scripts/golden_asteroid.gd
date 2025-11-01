extends Node

@export var collected: bool = true
var player_in_body = false

func _on_area_2d_body_entered(body):
	if body.name == "Ship":
		player_in_body = true
		
func _on_area_2d_body_exited(body):
	if body.name == "Ship":
		player_in_body = false
	
func _process(delta):
	if player_in_body and Input.is_action_just_pressed("interact"):
		GameController.package_collected(collected)
		queue_free()
