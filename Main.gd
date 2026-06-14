extends Node2D

const POINTS_TO_WIN = 5

var game_over = false
var round_over = false

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	update_score_label()

func _process(_delta):

	if round_over and !game_over and Input.is_key_pressed(KEY_C):
		get_tree().paused = false
		get_tree().reload_current_scene()

	if game_over and Input.is_key_pressed(KEY_R):
		GameManager.reset_scores()
		get_tree().paused = false
		get_tree().reload_current_scene()

func player_died(player_name):

	if game_over or round_over:
		return

	round_over = true

	if player_name == "Player1":
		GameManager.p2_score += 1

	elif player_name == "Player2":
		GameManager.p1_score += 1

	update_score_label()

	if GameManager.p1_score >= POINTS_TO_WIN:
		end_game("PLAYER 1 WINS THE GAME!")

	elif GameManager.p2_score >= POINTS_TO_WIN:
		end_game("PLAYER 2 WINS THE GAME!")

	else:
		$WinnerLabel.text = "P1: %d   P2: %d\nPress C To Continue" % [
			GameManager.p1_score,
			GameManager.p2_score
		]

		get_tree().paused = true

func update_score_label():
	$ScoreLabel.text = "Player One: %d   Player Two: %d" % [
		GameManager.p1_score,
		GameManager.p2_score
	]

func end_game(message):
	game_over = true

	$WinnerLabel.text = message + "\nPress R To Restart"

	get_tree().paused = true
