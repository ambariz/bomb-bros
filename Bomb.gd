extends Node2D

const EXPLOSION_SCENE = preload("res://Explosion.tscn")
const TILE_SIZE = 24

func _ready():
	$Timer.timeout.connect(_on_timer_timeout)
	$Timer.start()

func _on_timer_timeout():

	spawn_explosion(Vector2.ZERO, "center")

	spawn_explosion(Vector2(TILE_SIZE, 0), "side")
	spawn_explosion(Vector2(-TILE_SIZE, 0), "side")
	spawn_explosion(Vector2(0, TILE_SIZE), "side")
	spawn_explosion(Vector2(0, -TILE_SIZE), "side")

	queue_free()

func spawn_explosion(offset, type):
	var explosion = EXPLOSION_SCENE.instantiate()

	explosion.explosion_type = type

	get_tree().current_scene.add_child(explosion)
	explosion.global_position = global_position + offset
