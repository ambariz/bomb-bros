extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

	await get_tree().create_timer(0.5).timeout
	queue_free()

func _on_body_entered(body):
	if body.name == "Player1" or body.name == "Player2":

		get_tree().current_scene.player_died(body.name)

		body.queue_free()
