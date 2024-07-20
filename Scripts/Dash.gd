extends Node2D

@onready var duration_timer = $DurationTimer
@onready var cooldown_timer = $CooldownTimer
@onready var ghost_spawn = $GhostSpawn

var dash_ghost = preload("res://Prefabs/DashGhost.tscn")
var sprite: Sprite2D

func set_cooldown(duration):
	cooldown_timer.wait_time = duration

func start_dash(duration: float, current_sprite: Sprite2D):
	sprite = current_sprite
	
	if cooldown_timer.is_stopped():
		duration_timer.wait_time = duration
		duration_timer.start()
		
		ghost_spawn.start()
		ghost_instance()
	
func is_dashing():
	return !duration_timer.is_stopped()


func _on_duration_timer_timeout():
	ghost_spawn.stop()
	cooldown_timer.start()
	
func ghost_instance():
	var ghost: Sprite2D = dash_ghost.instantiate()
	get_parent().get_parent().add_child(ghost)
	
	ghost.global_position = global_position
	ghost.texture = sprite.texture
	ghost.vframes = sprite.vframes
	ghost.hframes = sprite.hframes
	ghost.frame = sprite.frame


func _on_ghost_spawn_timeout():
	ghost_instance()
