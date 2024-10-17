extends Node
class_name FiniteStateMachine

var states: Dictionary = {}
@export var initial_state: State
var current_state: State

# Initialize nodes
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.change_state.connect(_change_state)
			_set_shared_vars(child)
	
	if initial_state:
		current_state = initial_state
		current_state.enter()

func _set_shared_vars(state: State) -> void:
	pass

#region State Runtime
func _process(delta: float) -> void:
	if current_state:
		current_state.update()

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update()
#endregion

#region State Changes
func _change_state(state: State, new_state: State) -> void:
	if state != current_state:
		push_error(
			"%s is trying to change state to %s, while %s is current state" 
		 	% [state, new_state, current_state]
		)
		return
	
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()
	
func force_change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

#endregion

func parse_state_name(state: String) -> State:
	if not states.has(state):
		push_error("State %s does not exist in this state machine!" % state)
		return null
	
	return states[state]
	
	
