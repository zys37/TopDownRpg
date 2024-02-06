extends Camera2D
var player: Node2D
var cameraoffset: Vector2 = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float)->void:
	if player:
		# Get the player global position
		var player_global_pos = player.global_position
		var target_pos = player_global_pos + cameraoffset
		self.position = self.position.lerp(target_pos, 0.1)
	pass
