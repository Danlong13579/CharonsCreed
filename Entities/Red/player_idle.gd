class_name PlayerIdle extends PlayerState

func Enter() -> void:
	player.velocity = Vector2.ZERO

func Physics_Update(_delta: float) -> void:
	set_idle_animation_direction()
	
	if get_movement():
		Transition.emit(self, "move")
		
	if get_attack():
		Transition.emit(self, "attack")

func set_idle_animation_direction() -> void:
	if player.last_facing_dir == player.Direction.DOWN:
		player.animation.play("idle_down")
	if player.last_facing_dir == player.Direction.UP:
		player.animation.play("idle_up")
	if player.last_facing_dir == player.Direction.LEFT:
		player.animation.play("idle_left")
	if player.last_facing_dir == player.Direction.RIGHT:
		player.animation.play("idle_right")
