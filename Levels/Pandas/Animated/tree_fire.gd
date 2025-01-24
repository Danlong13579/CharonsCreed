@tool
extends Area2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var random_frame = randi_range(0, 5)

func _ready() -> void:
	animated_sprite.frame = random_frame
	animated_sprite.play("tree_fire")
