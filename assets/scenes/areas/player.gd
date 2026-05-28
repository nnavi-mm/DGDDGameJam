extends CharacterBody2D

@export var speed = 200
@export var jump_speed = -400
@export var gravity = 1200



func _physics_process(delta):
	# Add gravity every frame
	velocity.y += gravity * delta

	# Input affects x axis only
	velocity.x = Input.get_axis("walk_left", "walk_right") * speed
	
	move_and_slide()
	grab_object()
	# Only allow jumping when on the ground
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed

func grab_object():
	var bodies = $Grab.get_overlapping_bodies()
	for body in bodies:
		if body.name == "grabbable":
			if Input.is_action_pressed("grab"):
				print("grabbing")
				body.global_position = $Grab/grab_point.global_position
				body.is_grabbed = true
			if Input.is_action_just_released("grab"):
				print("throw")
				body.is_grabbed = false
				body.velocity.x = 300; #not directionally based so this will need to be changed
				body.velocity.y = -200;
