extends CharacterBody2D


@export var force: float = 50.0
@export var torque: float = .05
var rotateSpeed = 0
@onready var rocket: AnimatedSprite2D = $AnimatedSprite2D
@onready var respawn_point = get_tree().get_current_scene().get_node("HomeBase/RespawnPoint")

var package_collected: bool = false
var asteroid_collected: bool = false

func _ready():
	var data = SaveManager.load_game()
	GameController.package_collected = data["package_collected"]
	GameController.asteroid_collected = data["asteroid_collected"]

func respawn_to_base():
	global_position = respawn_point.global_position
	
	velocity = Vector2.ZERO
	rotateSpeed = 0
	rotation = 0

	var data = SaveManager.load_game()
	GameController.package_collected = data["package_collected"]
	GameController.asteroid_collected = data["asteroid_collected"]
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if Input.is_action_pressed("turn_left") and not(Input.is_action_pressed("turn_right")) :
		rotateSpeed -= torque*delta
	elif Input.is_action_pressed("turn_right") and not(Input.is_action_pressed("turn_left")):
		rotateSpeed += torque*delta
	
	rotation += rotateSpeed
		
	if Input.is_action_pressed("thrust"):
		velocity += Vector2.UP.rotated(rotation)*force*delta
		rocket.play("thrust")
	else:
		rocket.play("default")

	var collision = move_and_collide(velocity * delta)
	if collision:
		print("Collision Detected, respawning...")
		respawn_to_base()
			
