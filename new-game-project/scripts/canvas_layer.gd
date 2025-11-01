extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Package Collected".text = "Package Collected: False"
	$"Asteroid Collected".text = "Asteroid Collected: False"
	GameController.connect("asteroid_collect", Callable(self, "_on_asteroid_collect"))
	GameController.connect("package_collect", Callable(self, "_on_package_collect"))
	GameController.connect("package_return", Callable(self, "_on_package_return"))

func _on_asteroid_collect(value):
	if value:
		$"Asteroid Collected".text = "Asteroid Collected: True"
		
func _on_package_collect(value):
	if value:
		$"Package Collected".text = "Package Collected: True"

func _on_package_return(value):
	if value:
		$"Package Collected".text = "Package Collected: False"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
