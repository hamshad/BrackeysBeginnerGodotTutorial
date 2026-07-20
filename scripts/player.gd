extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# The process methods works on different intervals while the _physics_process
# method works on fixed interval of 60, its great for nodes that need to collide.
func _physics_process(delta: float) -> void:
	
	# Add the gravity (default value of 980).
	if not is_on_floor():
		velocity += get_gravity() * delta

	# We set up our own key bindings and pass it on to the methods like "jump"
	# Add in from Project > Project Settings... > Input Map > "Add New Action"
	# I added "jump", "move_left" and "move_right"
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	# Gets input direction: 1, 0 and -1
	var direction := Input.get_axis("move_left", "move_right")
	
	# Fliping the sprite based on direction
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play Animation
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play('jump')
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
