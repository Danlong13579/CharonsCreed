class_name Player extends CharacterBody2D

var moveSpeed := 6000
var dashSpeed := 20000
const dashDuration = 0.2

func _physics_process(delta):
	var inputDirection = Input.get_vector("move_left","move_right","move_up","move_down").normalized()
		
	var speed = moveSpeed
	
	velocity = inputDirection * speed * delta
	move_and_slide()
