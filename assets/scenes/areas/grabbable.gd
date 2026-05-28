extends CharacterBody2D

@export var speed = 200
@export var jump_speed = -400
@export var gravity = 1200
var is_grabbed = false

func _physics_process(delta):
	# Add gravity every frame
	if is_grabbed == false:
		velocity.y += gravity * delta
	move_and_slide()
