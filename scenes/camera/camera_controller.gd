extends Camera2D

@export var player: Player
@export var follow_speed: float

func _process(delta: float) -> void:
	position = position.lerp(player.position, follow_speed * delta)
