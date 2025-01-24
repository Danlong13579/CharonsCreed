extends Node

@export var initial_state: State

@export_category("Player Data")
@export var player: CharacterBody2D

@export_category("State Machine Data")
@export var current_state: PlayerState
@export var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transition.connect(on_child_transition)
			if player:
				child.player = player
			
	if initial_state:
		initial_state.Enter()
		current_state = initial_state

func _process(delta: float) -> void: 
	if current_state:
		current_state.Update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.set_movement(snapped(
			Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")), 
			Vector2(0.01, 0.01)))
		current_state.Physics_Update(delta)

func on_child_transition(state: State, next_name: String) -> void:
	if state != current_state:
		return
	
	var next_state: State = states.get(next_name.to_lower())

	if !next_state:
		return

	if current_state:
		current_state.Exit()
	
	if next_state is State:
		next_state.Enter()
		
		current_state = next_state
