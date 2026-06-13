extends CharacterBody2D

const SPEED = 200.0
const BOMB_SCENE = preload("res://Bomb.tscn")
const MAX_BOMBS = 2

var can_place_bomb := true
var active_bombs := 0

func _physics_process(_delta):
	var dir = Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		dir.y -= 1
	if Input.is_action_pressed("ui_down"):
		dir.y += 1
	if Input.is_action_pressed("ui_left"):
		dir.x -= 1
	if Input.is_action_pressed("ui_right"):
		dir.x += 1

	velocity = dir.normalized() * SPEED
	move_and_slide()

	if Input.is_key_pressed(KEY_ENTER) and can_place_bomb:
		can_place_bomb = false
		place_bomb()

	if !Input.is_key_pressed(KEY_ENTER):
		can_place_bomb = true

func place_bomb():
	if active_bombs >= MAX_BOMBS:
		return

	var bomb = BOMB_SCENE.instantiate()

	var tile_size = 24

	var bomb_pos = Vector2(
		round(global_position.x / tile_size) * tile_size,
		round(global_position.y / tile_size) * tile_size
	)

	get_tree().current_scene.add_child(bomb)
	bomb.global_position = bomb_pos

	active_bombs += 1

	bomb.tree_exited.connect(func():
		active_bombs -= 1
	)
