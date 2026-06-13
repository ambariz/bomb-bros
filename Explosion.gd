extends Area2D

var explosion_type = "center"

const CENTER_TEXTURE = preload("res://explosion_center.png")
const SIDE_TEXTURE = preload("res://explosion_side.png")

func _ready():

	if explosion_type == "center":
		$Sprite2D.texture = CENTER_TEXTURE
	else:
		$Sprite2D.texture = SIDE_TEXTURE

	body_entered.connect(_on_body_entered)

	await get_tree().create_timer(0.5).timeout
	queue_free()

func _on_body_entered(body):
	if body.name == "Player1" or body.name == "Player2":
		get_tree().current_scene.player_died(body.name)
		body.queue_free()
