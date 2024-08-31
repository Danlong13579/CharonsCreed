class_name Player extends CharacterBody2D

var moveSpeed := 6000
var dashSpeed := 20000
const dashDuration = 0.2

@onready var dash = $Dash
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	animation.play("idle_front")

func _physics_process(delta):
	dash.set_cooldown(1.0)
	var inputDirection = Input.get_vector("move_left","move_right","move_up","move_down")
	#var inputDirection = Vector2(Input.get_axis("move_left","move_right"), Input.get_axis("move_up","move_down"))
	var input = Input.get_action_strength("move_left", )
	print(inputDirection)
	
	#if Input.is_action_just_pressed("dash"):
		#if !dash.is_dashing():
			#dash.start_dash(dashDuration, animated_sprite)
		
	var speed = dashSpeed if dash.is_dashing() else moveSpeed
	
	velocity = inputDirection * speed * delta
	handle_animations(inputDirection)
	move_and_slide()
	
func handle_animations(direction: Vector2) -> void:
	
	pass
