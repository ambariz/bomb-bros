extends Node2D

var game_over = false

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_delta):
	if game_over and Input.is_key_pressed(KEY_R):
		get_tree().paused = false
		get_tree().reload_current_scene()

func player_died(_player_name):

	if game_over:
		return

	await get_tree().process_frame

	var p1_alive = get_node_or_null("Player1") != null
	var p2_alive = get_node_or_null("Player2") != null

	game_over = true

	if !p1_alive and !p2_alive:
		$WinnerLabel.text = "DRAW!\nPress R"

	elif !p1_alive:
		$WinnerLabel.text = "PLAYER 2 WINS!\nPress R"

	elif !p2_alive:
		$WinnerLabel.text = "PLAYER 1 WINS!\nPress R"

	get_tree().paused = true
