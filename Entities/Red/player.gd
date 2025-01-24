class_name Player extends CharacterBody2D

enum Direction { LEFT, RIGHT, UP, DOWN }

@onready var sprite: Sprite2D = $PlayerSprite
@onready var animation: AnimationPlayer = $PlayerAnimation
@onready var attack_sound: AudioStreamPlayer2D = $AttackSound
@onready var dash_sound: AudioStreamPlayer2D = $DashSound

@export var last_facing_dir: Direction = Direction.DOWN

func _physics_process(_delta):
	move_and_slide()
