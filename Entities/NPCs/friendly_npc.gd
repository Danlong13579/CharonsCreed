@tool
class_name FriendlyNPC extends CharacterBody2D

@export_category("Character Visuals")
@export var sprite_sheet: Texture2D
@export var animator: AnimationPlayer

@export_category("Character Dialog")
@export_range(1, 5, 0.5, "suffix:in secondcb") var dialog_fade_time: float = 2.0
@export var dialog: Dialog

@onready var sprite: Sprite2D = $Sprite2D
@onready var label: Label = $Label
@onready var dialog_timer: Timer = $DialogTimer


func _ready() -> void:
	sprite.texture = sprite_sheet
	sprite.hframes = 32
	sprite.vframes = 1
	sprite.frame = 0
	
	label.visible = false
	dialog_timer.wait_time = dialog_fade_time

func _body_entered(body) -> void:
	print("entered")
	if body is Player:
		if !dialog_timer.is_stopped():
			print("stopped timer")
			dialog_timer.paused = true
		label.visible = true


func _body_exited(body) -> void:
	print("exited")
	if body is Player:
		print("timer start")
		if dialog_timer.is_paused():
			dialog_timer.paused = false
		dialog_timer.start()


func _on_dialog_timer_timeout():
	print("timer time out")
	label.visible = false
