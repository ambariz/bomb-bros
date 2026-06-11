extends CharacterBody2D

const SPEED = 200.0

func _physics_process(delta):
	var dir = Vector2.ZERO

	if Input.is_key_pressed(KEY_D):
		dir.x += 1
	if Input.is_key_pressed(KEY_A):
		dir.x -= 1
	if Input.is_key_pressed(KEY_S):
		dir.y += 1
	if Input.is_key_pressed(KEY_W):
		dir.y -= 1

	velocity = dir.normalized() * SPEED
	move_and_slide()
