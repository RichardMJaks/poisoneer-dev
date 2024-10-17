extends Node
class_name State

signal change_state(state: State, new_state: State)

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func update() -> void:
	pass
	
func physics_update() -> void:
	pass

func _to_string() -> String:
	return name
