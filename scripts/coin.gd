extends Area2D


# This is Signal function, i can see it in Signals section on the right bars besides Inspector.
func _on_body_entered(body: Node2D) -> void:
	print("+1 coin!") # Replace with function body.
	queue_free() # This removes the coin from the screen
