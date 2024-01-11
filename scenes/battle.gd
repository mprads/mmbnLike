extends Node2D

@export var char_stats: CharacterStats

@onready var player: Player = $Player
@onready var player_handler: PlayerHandler = $PlayerHandler

func _ready() -> void:
	var new_stats: CharacterStats = char_stats.create_instance()

	start_battle(new_stats)


func start_battle(stats: CharacterStats) -> void:
	player_handler.start_battle(stats)
