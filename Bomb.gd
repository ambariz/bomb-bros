extends Node2D

const EXPLOSION_SCENE = preload("res://Explosion.tscn")

func _ready():
	$Timer.timeout.connect(_on_timer_timeout)
	$Timer.start()

func _on_timer_timeout():
	var explosion = EXPLOSION_SCENE.instantiate()
	var explosion_pos = global_position

	get_tree().current_scene.add_child(explosion)
	explosion.global_position = explosion_pos

	queue_free()
