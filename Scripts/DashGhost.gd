extends Sprite2D

#Sets transition and ease for all following tweens
func _ready():
	var tween: Tween = get_tree().create_tween() #Creates a Tween, as far as I know Tween as a node has been removed
	tween.set_trans(Tween.TRANS_QUART) 
	tween.set_ease(Tween.EASE_OUT)

	#Tween to execute, 
	tween.tween_property(self,"modulate:a",0.0,0.5)

	tween.tween_callback(queue_free)
	# tweens now run on a queue, this can be changed to parallel running and more with some of the new features, if no documentation is available yet I suggest Bramwell's video about Tweens in godot 4 Alpha 6 for an explanation on how to use said features.
