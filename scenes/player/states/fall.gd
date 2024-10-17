extends PlayerState

@export var idle: PlayerState

func enter() -> void:
	super()
	
func exit() -> void:
	super()
	
func update() -> void:
	pass
	
func physics_update() -> void:
	if player.is_on_floor():
		change_state.emit(self, idle)
		return
