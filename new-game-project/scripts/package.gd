extends Node2D
class_name Package


var player_in_body = false
@onready var ding: AudioStreamPlayer = $Ding


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Ship":
		player_in_body = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Ship":
		player_in_body = false
		
func _process(delta):
	if player_in_body and Input.is_action_just_pressed("interact"):
	#if Input.is_action_just_pressed("interact"):
		ding.play()
		print($Ding)
		print("Package Collected!")
		await get_tree().create_timer(0.1).timeout
		
		queue_free()
