extends RigidBody2D

func _process(delta: float) -> void:
	print(linear_velocity.length())
	rotation = linear_velocity.angle()
