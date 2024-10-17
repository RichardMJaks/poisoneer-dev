extends PlayerState

@export var idle: PlayerState
@export var fall: PlayerState

func enter() -> void:
	super()
	player.velocity.y = -player.get_jump_force()
	
func exit() -> void:
	super()
	
func update() -> void:
	pass
	
func physics_update() -> void:
	if player.is_on_floor():
		change_state.emit(self, idle)
		return
	
	if player.velocity.y > 0:
		change_state.emit(self, fall)
		
