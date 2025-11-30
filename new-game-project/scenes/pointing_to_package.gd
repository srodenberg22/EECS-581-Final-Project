extends Sprite2D

@export var player: Node2D  # Your player node (Ship)
@export var respawn_point: Package  # Your RespawnPoint marker
@export var minimap_radius: float = 90.0  # Distance from minimap center to edge
@export var minimap_container: SubViewportContainer  # MinimapContainer

var minimap_center: Vector2

func _ready():
	EventController.connect("package_collected", Callable(self, "_on_package_collected"))
	if minimap_container:
		minimap_center = minimap_container.size / 2.0
	else:
		minimap_center = Vector2(100, 100)
	

func _process(_delta):
	if not player or not respawn_point:
		return
	
	# Calculate direction from player to respawn point
	var direction_to_home = (respawn_point.global_position - player.global_position)
	
	# Normalize the direction
	if direction_to_home.length() > 0:
		direction_to_home = direction_to_home.normalized()
	
	# INSTANTLY position arrow on the edge of the minimap
	position = minimap_center + direction_to_home * minimap_radius
	
	# Rotate arrow to point toward respawn point
	rotation = direction_to_home.angle() + PI / 2  # Adjust if needed
	
func _on_package_collected(value):
	queue_free()
