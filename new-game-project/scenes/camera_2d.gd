extends Camera2D
var zoomSpeed = 5

@export var target: Node2D
var spin = true

func _process(delta):
	
	#check for target
	if target:
		#move to keep up
		position = target.global_position

		#track wether the player should spin
		if spin:
			rotation = target.rotation

	
	
	var zoomDirection = 1
	if Input.is_action_just_pressed("zoom_in"):
		zoomDirection = 1.01
	elif Input.is_action_just_pressed("zoom_out"):
		zoomDirection = 0.9900990099
	
	if zoomDirection != 1:
		zoom = zoom * Vector2.ONE * ( pow(zoomDirection, zoomSpeed) )
