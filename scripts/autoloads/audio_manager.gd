extends Node
## Manages music and sound effect playback

var music_player: AudioStreamPlayer
var sfx_players: Array[AudioStreamPlayer] = []

var is_muted: bool = false
const MUSIC_VOLUME_DB = -3.0
const SFX_POOL_SIZE = 8

func _ready() -> void:
	_setup_music_player()
	_setup_sfx_pool()
	_load_settings()

func _setup_music_player() -> void:
	music_player = AudioStreamPlayer.new()
	music_player.bus = "Master"
	music_player.volume_db = MUSIC_VOLUME_DB
	add_child(music_player)

func _setup_sfx_pool() -> void:
	for i in SFX_POOL_SIZE:
		var player = AudioStreamPlayer.new()
		player.bus = "Master"
		add_child(player)
		sfx_players.append(player)

# Music control
func play_music(stream: AudioStream, loop: bool = true) -> void:
	if is_muted:
		return
	music_player.stream = stream
	music_player.play()

func stop_music() -> void:
	music_player.stop()

# SFX control
func play_sfx(stream: AudioStream, volume_db: float = 0.0) -> void:
	if is_muted:
		return
	for player in sfx_players:
		if not player.playing:
			player.stream = stream
			player.volume_db = volume_db
			player.play()
			return

# Mute toggle
func toggle_mute() -> void:
	is_muted = !is_muted
	if is_muted:
		music_player.stop()
	_save_settings()

func set_muted(muted: bool) -> void:
	is_muted = muted
	if is_muted:
		music_player.stop()
	_save_settings()

# Settings persistence
const SETTINGS_FILE = "user://audio_settings.cfg"

func _load_settings() -> void:
	var config = ConfigFile.new()
	if config.load(SETTINGS_FILE) == OK:
		is_muted = config.get_value("audio", "muted", false)

func _save_settings() -> void:
	var config = ConfigFile.new()
	config.set_value("audio", "muted", is_muted)
	config.save(SETTINGS_FILE)
