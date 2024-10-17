extends MovementHandler
class_name PlayerMovementHandler

var dir: float = 0
var wants_jump: bool = false

func _process(delta: float) -> void:
	wants_jump = Input.is_action_just_pressed("m_jump")
	dir = Input.get_axis("m_left", "m_right")

func get_movement_intent() -> float:
	return dir

func get_jump_intent() -> bool:
	return wants_jump
	
func get_attack_intent() -> bool:
	return false
