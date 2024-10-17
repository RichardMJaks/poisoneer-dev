extends PlayerState

@export var idle: PlayerState

func _handle_input(event: InputEvent) -> PlayerState:
	return null

func enter() -> void:
	super()

func exit() -> void:
	super()

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass
