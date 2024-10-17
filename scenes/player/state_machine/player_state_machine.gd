extends Node
class_name PlayerStateMachine

# State information
var states : Dictionary = {}
var active_state : PlayerState
@export var initial_state : PlayerState

# Shared properties
@export var player : Player
@export var animation_player : AnimationPlayer

func _ready() -> void:
	for child in get_children():
		if child is PlayerState:
			states[child.name] = child
			child.state_changed.connect(change_state)
			
			# Add various shared properties
			if animation_player:
				child.anim = animation_player
			if player:
				child.player = player
	
	if initial_state:
		active_state = initial_state
		active_state.enter()

#region State Runtime
func _process(delta: float) -> void:
	if active_state:
		active_state.update(delta)

func _physics_process(delta: float) -> void:
	if active_state:
		active_state.update(delta)

func _unhandled_input(event: InputEvent) -> void:
	if active_state:
		active_state.handle_input(event)
#endregion

#region State changes
func change_state(state: PlayerState, new_state: PlayerState) -> void:
	if state != active_state:
		push_warning(
			"%s is trying to change the state to %s, while current active state is %s." % 
			[state.name, new_state.name, active_state.name]
		)
		return
	
	active_state.exit()
	
	active_state = new_state
	active_state.enter()

func force_state_override(s_state: String) -> void:
	if not states.has(s_state):
		push_error("Cannot override state! Missing state named " + s_state)
		return
	
	if active_state:
		active_state.exit()
	
	var state: PlayerState = states[s_state]
	state.enter()
#endregion
