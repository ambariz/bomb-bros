
extends Area2D

const EXPLOSION_SCENE = preload("res://Explosion.tscn")
const TILE_SIZE = 24

var owner_player = null
var solid = false

func _ready():
	body_exited.connect(_on_body_exited)

	$Timer.timeout.connect(_on_timer_timeout)
	$Timer.start()

func _on_body_exited(body):
	if body == owner_player:
		make_solid()

func make_solid():
	if solid:
		return

	solid = true

	var static_body = StaticBody2D.new()
	static_body.name = "SolidPart"

	var collision = CollisionShape2D.new()
	collision.shape = $CollisionShape2D.shape

	static_body.add_child(collision)
	add_child(static_body)

func _on_timer_timeout():

	spawn_explosion(Vector2.ZERO, "center")

	spawn_explosion(Vector2(-TILE_SIZE, 0), "left")
	spawn_explosion(Vector2(TILE_SIZE, 0), "right")

	spawn_explosion(Vector2(0, -TILE_SIZE), "up")
	spawn_explosion(Vector2(0, TILE_SIZE), "down")

	queue_free()

func spawn_explosion(offset, explosion_type):
	var explosion = EXPLOSION_SCENE.instantiate()

	explosion.explosion_type = explosion_type

	get_tree().current_scene.add_child(explosion)
	explosion.global_position = global_position + offset
