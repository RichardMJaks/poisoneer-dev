extends FiniteStateMachine
class_name PlayerFSM

@export var player: Player
@export var animation_player: AnimationPlayer
@export var movement_handler: PlayerMovementHandler

func _set_shared_vars(state: State) -> void:
	if not state is PlayerState:
		return
	
	if player:
		state.player = player
	if animation_player:
		state.anim = animation_player
	if movement_handler:
		state.movement_handler = movement_handler
