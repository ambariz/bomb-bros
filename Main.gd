extends Node2D

var game_over = false

func player_died(player_name):
	if game_over:
		return

	game_over = true

	var label = $WinnerLabel

	if player_name == "Player1":
		label.text = "PLAYER 2 WINS!"

	if player_name == "Player2":
		label.text = "PLAYER 1 WINS!"

	get_tree().paused = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
