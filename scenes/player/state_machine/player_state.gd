extends Node
class_name PlayerState

signal state_changed(state: PlayerState, new_state)

var player: Player

var anim: AnimationPlayer
@export var animation_name: String

func handle_input(event: InputEvent) -> PlayerState:
	return null

func get_movement_input() -> Vector2:
	return Input.get_axis("m_left", "m_right") * Vector2.RIGHT

func enter() -> void:
	if animation_name:
		anim.play(animation_name)

func exit() -> void:
	pass


func update(delta: float) -> void:
	pass
	
func physics_update(delta: float) -> void:
	pass
