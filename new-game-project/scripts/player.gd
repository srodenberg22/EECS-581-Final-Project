extends CharacterBody2D


@export var force: float = 400.0
@export var rotateSpeed: float = 5.0
@onready var rocket: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if Input.is_action_pressed("ui_left"):
		rotation -= rotateSpeed*delta
	elif Input.is_action_pressed("ui_right"):
		rotation += rotateSpeed*delta
		
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2.UP.rotated(rotation)*force*delta
		rocket.play("thrust")
	else:
		rocket.play("default")

	move_and_slide()
