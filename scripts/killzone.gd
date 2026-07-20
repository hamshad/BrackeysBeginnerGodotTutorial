extends Area2D

# I got this by dragging the Timer from the left section
# and dropped it holding Command
# The $Timer is the path of the node. For ex. from game to coin = $Player/Coin
@onready var timer: Timer = $Timer

# The green icon on the left means that this method is Signal
func _on_body_entered(body: Node2D) -> void:
	print("You are Dead!")
	Engine.time_scale = 0.5
	body.velocity.y = -200.0
	body.get_node("CollisionShape2D").queue_free()  
	timer.start()


# When timer timesout we are reloading the main scene
func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
