extends Node

var player_in_body = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Ship":
		player_in_body = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Ship":
		player_in_body = false

		
func _process(delta):
	if player_in_body and Input.is_action_just_pressed("interact"):
		if GameController.package_collected == true:
			GameController.package_return(GameController.asteroid_collected)
			print("package returned!")
			
