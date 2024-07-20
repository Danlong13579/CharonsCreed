extends CharacterBody2D

var moveSpeed := 6000
var dashSpeed := 20000
const dashDuration = 0.2
 
@onready var sprite = $Sprite2D
@onready var animation_tree = $AnimationTree
@onready var animation_player = $AnimationPlayer
@onready var dash = $Dash
@onready var health_timmer = $HealthTimmer

func _ready():
	health_timmer.start()

func _physics_process(delta):
	dash.set_cooldown(1.0)
	var inputDirection = Input.get_vector("move_left","move_right","move_up","move_down").normalized()

	
	transition_animation(inputDirection)
	
	if Input.is_action_just_pressed("dash"):
		if !dash.is_dashing():
			dash.start_dash(dashDuration, sprite)
		
	var speed = dashSpeed if dash.is_dashing() else moveSpeed
	
	velocity = inputDirection * speed * delta
	move_and_slide()
	
func transition_animation(inputDirection: Vector2):
	if inputDirection != Vector2.ZERO:
		animation_tree.get("parameters/playback").travel("Walk")
		animation_tree.set("parameters/Idle/blend_position", inputDirection)
		animation_tree.set("parameters/Walk/blend_position", inputDirection)
	else:
		animation_tree.get("parameters/playback").travel("Idle")


func _on_health_timmer_timeout():
	print("health gained")
	pass # Replace with function body.
