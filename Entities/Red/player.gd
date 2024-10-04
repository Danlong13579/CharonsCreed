class_name Player extends CharacterBody2D

var moveSpeed := 12000
var dashSpeed := 20000
const dashDuration = 0.2

@onready var animated_sprite = $AnimatedSprite2D
@onready var dash = $Dash

func _physics_process(delta):
	dash.set_cooldown(1.0)
	var inputDirection = Input.get_vector("move_left","move_right","move_up","move_down").normalized()
	
	#if Input.is_action_just_pressed("dash"):
		#if !dash.is_dashing():
			#dash.start_dash(dashDuration, animated_sprite)
		
	var speed = dashSpeed if dash.is_dashing() else moveSpeed
	
	var target_velocity = inputDirection * speed * delta
	velocity = velocity.lerp(target_velocity, 0.25)
	move_and_slide()
