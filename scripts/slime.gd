extends Node2D

const SPEED = 60

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var stomp_area: Area2D = $StompArea

# 1 is for right and -1 is for left.
# If we multipy the x with negative (-) it will go in opposite direction
var direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta



func _on_stomp_area_body_entered(body: Node2D) -> void:
	print("Player stomped on Slime!")
	if body.velocity.y > 0:
		body.velocity.y = -200
	queue_free()
