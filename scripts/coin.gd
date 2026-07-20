extends Area2D

@onready var game_manager: Node = %GameManager

# This is Signal function, i can see it in Signals section on the right bars besides Inspector.
func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	queue_free() # This removes the coin from the screen
