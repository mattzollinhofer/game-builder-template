extends Node
## Global game state - tracks current game session

# Difficulty levels
enum Difficulty { NORMAL, HARD }

# Current session state
var selected_level: int = 1
var selected_character: String = "default"
var selected_difficulty: Difficulty = Difficulty.NORMAL
var current_lives: int = 3

# Difficulty settings
const LIVES_BY_DIFFICULTY = {
	Difficulty.NORMAL: 3,
	Difficulty.HARD: 1
}

func _ready() -> void:
	reset_session()

func reset_session() -> void:
	"""Reset to defaults for new game."""
	current_lives = LIVES_BY_DIFFICULTY[selected_difficulty]

func set_selected_level(level: int) -> void:
	selected_level = level

func get_selected_level() -> int:
	return selected_level

func get_selected_level_path() -> String:
	return "res://levels/level_%d.json" % selected_level

func set_selected_character(character: String) -> void:
	selected_character = character

func get_selected_character() -> String:
	return selected_character

func set_selected_difficulty(difficulty: Difficulty) -> void:
	selected_difficulty = difficulty
	current_lives = LIVES_BY_DIFFICULTY[difficulty]

func set_current_lives(lives: int) -> void:
	current_lives = lives

func get_current_lives() -> int:
	return current_lives
