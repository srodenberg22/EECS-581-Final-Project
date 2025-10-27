extends CharacterBody2D


@export var force: float = 50.0
@export var torque: float = .05
var rotateSpeed = 0
@onready var rocket: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if Input.is_action_pressed("ui_left") and not(Input.is_action_pressed("ui_right")) :
		rotateSpeed -= torque*delta
	elif Input.is_action_pressed("ui_right") and not(Input.is_action_pressed("ui_left")):
		rotateSpeed += torque*delta
	
	rotation += rotateSpeed
		
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2.UP.rotated(rotation)*force*delta
		rocket.play("thrust")
	else:
		rocket.play("default")

	var collision = move_and_collide(velocity * delta)
	if collision:
		print("Collision Detected, ending game")
		get_tree().quit()
			
