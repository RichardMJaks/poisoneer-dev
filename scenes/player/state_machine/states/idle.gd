extends PlayerState

@export var run: PlayerState

func _handle_input(event: InputEvent) -> PlayerState:
	if get_movement_input():
		state_changed.emit(self, run)
		return run
	
	return null

func enter() -> void:
	super()

func exit() -> void:
	super()

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass
