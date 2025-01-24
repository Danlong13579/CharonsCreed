class_name PlayerMove extends PlayerState

func Physics_Update(_delta: float) -> void:
	set_move_animation_direction()
	player.velocity = movement * speed
	
	if get_idle():
		Transition.emit(self, "idle")

	if get_attack():
		Transition.emit(self, "attack")

func set_move_animation_direction() -> void:
	var input_dir = get_direction()
	
	if input_dir == player.Direction.DOWN:
		player.animation.play("move_down")
	if input_dir == player.Direction.UP:
		player.animation.play("move_up")
	if input_dir == player.Direction.LEFT:
		player.animation.play("move_left")
	if input_dir == player.Direction.RIGHT:
		player.animation.play("move_right")
