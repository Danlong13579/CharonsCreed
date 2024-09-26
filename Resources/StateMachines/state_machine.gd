extends Node

@export var initial_state: PlayerState

@export_category("State Machine Data")
@export var current_state: PlayerState
@export var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is PlayerState:
			states[child.name.to_lower()] = child
			child.Transition.connect(on_child_transition)
			
	if initial_state:
		initial_state.Enter()
		current_state = initial_state

func _process(delta: float) -> void: 
	if current_state:
		current_state.Update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.Physics_Update(delta)

func on_child_transition(state: PlayerState, name: String) -> void:
	if state != current_state:
		return
	
	var next_state: PlayerState = states.get(name.to_lower())

	if !next_state:
		return

	if current_state:
		current_state.Exit()
	
	if next_state is PlayerState:
		next_state.Enter()
		
		current_state = next_state
