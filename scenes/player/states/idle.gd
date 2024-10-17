extends PlayerState

@export var run: PlayerState
@export var jump: PlayerState

func enter() -> void:
	player.velocity.x = 0
	super()
	
func exit() -> void:
	super()
	
func update() -> void:
	pass
	
func physics_update() -> void:
	if not movement_handler:
		push_error("Missing movement handler!")
		return
	
	if movement_handler.get_jump_intent():
		change_state.emit(self, jump)
	
	if movement_handler.get_movement_intent():
		change_state.emit(self, run)
