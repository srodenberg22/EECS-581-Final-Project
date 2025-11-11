extends Sprite2D
@export var camera: Camera2D
@export var target: Node2D
var spin = true


func _process(delta):
	
	#check for target
	if target:
		#move to keep up
		position = target.global_position

		#track wether the player should spin
		if not(spin):
			rotation = target.rotation

	if camera:
		scale = (Vector2(5, 5)/ camera.zoom)
