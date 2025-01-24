class_name PlayerState extends State

@export var player: Player
var movement: Vector2 = Vector2.ZERO
var speed: int = 210

@export var isDashing: bool = false
@export var isAttacking: bool = false

func get_idle():
	return movement == Vector2.ZERO

func get_movement():
	return movement != Vector2.ZERO
	
func set_movement(vector: Vector2):
	var x = vector.x
	var y = vector.y
	var hor = x > 0 or x < 0
	var ver = y > 0 or y < 0
	
	if hor and ver:
		movement = Vector2(clamp(x, -0.7, 0.7), clamp(y, -0.7, 0.7))
	else:
		movement = vector

func get_dash():
	return Input.is_action_pressed("dash")

func get_attack():
	return Input.is_action_pressed("attack")
	
func get_direction() -> Player.Direction:
	if movement.x > 0:
		player.last_facing_dir = player.Direction.RIGHT
		return player.Direction.RIGHT

	if movement.x < 0:
		player.last_facing_dir = player.Direction.LEFT
		return player.Direction.LEFT

	if movement.y > 0:
		player.last_facing_dir = player.Direction.DOWN
		return player.Direction.DOWN

	if movement.y < 0:
		player.last_facing_dir = player.Direction.UP
		return player.Direction.UP

	return player.last_facing_dir
