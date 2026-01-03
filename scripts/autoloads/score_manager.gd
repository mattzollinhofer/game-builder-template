extends Node
## Manages scoring and high score persistence

signal score_changed(new_score: int)

var current_score: int = 0
var high_scores: Array = []

const HIGH_SCORE_FILE = "user://high_scores.cfg"
const MAX_HIGH_SCORES = 10

func _ready() -> void:
	load_high_scores()

func reset_score() -> void:
	"""Reset score for new game."""
	current_score = 0
	score_changed.emit(current_score)

func add_points(points: int) -> void:
	"""Add points to current score."""
	current_score += points
	score_changed.emit(current_score)

func get_score() -> int:
	return current_score

# High score persistence
func load_high_scores() -> void:
	var config = ConfigFile.new()
	if config.load(HIGH_SCORE_FILE) == OK:
		high_scores = config.get_value("scores", "list", [])

func save_high_score() -> void:
	"""Save current score if it qualifies."""
	high_scores.append({
		"score": current_score,
		"date": Time.get_datetime_string_from_system()
	})
	high_scores.sort_custom(func(a, b): return a.score > b.score)
	high_scores = high_scores.slice(0, MAX_HIGH_SCORES)

	var config = ConfigFile.new()
	config.set_value("scores", "list", high_scores)
	config.save(HIGH_SCORE_FILE)

func is_high_score() -> bool:
	"""Check if current score would be a new high score."""
	if high_scores.is_empty():
		return current_score > 0
	return current_score > high_scores[0].score

func get_high_scores() -> Array:
	return high_scores
