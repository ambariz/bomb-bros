extends CharacterBody2D

const SPEED = 200.0
const BOMB_SCENE = preload("res://Bomb.tscn")

var can_place_bomb := true

func _physics_process(_delta):
	var dir = Vector2.ZERO
	print(global_position)
	if Input.is_key_pressed(KEY_W):
		dir.y -= 1
	if Input.is_key_pressed(KEY_S):
		dir.y += 1
	if Input.is_key_pressed(KEY_A):
		dir.x -= 1
	if Input.is_key_pressed(KEY_D):
		dir.x += 1

	velocity = dir.normalized() * SPEED
	move_and_slide()

	if Input.is_key_pressed(KEY_SPACE) and can_place_bomb:
		can_place_bomb = false
		place_bomb()

	if !Input.is_key_pressed(KEY_SPACE):
		can_place_bomb = true

func place_bomb():
	var bomb = BOMB_SCENE.instantiate()
	var bomb_pos = global_position

	print("Player:", bomb_pos)

	get_tree().current_scene.add_child(bomb)
	bomb.global_position = bomb_pos

	print("Bomb:", bomb.global_position)
