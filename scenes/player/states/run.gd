extends PlayerState

@export var idle: PlayerState
@export var jump: PlayerState

func enter() -> void:
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
	
	var dir = movement_handler.get_movement_intent()
	if not dir:
		change_state.emit(self, idle)
		return
	
	if dir == 1:
		player.facing_left = false
	elif dir == -1:
		player.facing_left = true
	
	player.velocity.x = dir * player.speed
