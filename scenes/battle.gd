extends Node2D

@export var player_stats: CharacterStats
@export var enemy_stats: CharacterStats

@onready var player_handler: PlayerHandler = $PlayerHandler
@onready var enemy_handler: EnemyHandler = $EnemyHandler

func _ready() -> void:
	Events.player_died.connect(_on_player_died)
	Events.enemy_died.connect(_on_enemy_died)
	#TODO: replace with character select on start
	var new_player_stats: CharacterStats = player_stats.create_instance()
	var new_enemy_stats: CharacterStats = enemy_stats.create_instance()

	start_battle(new_player_stats, new_enemy_stats)


func start_battle(player_stats: CharacterStats, enemy_stats: CharacterStats) -> void:
	player_handler.start_battle(player_stats)
	enemy_handler.start_battle(enemy_stats)


func _on_player_died() -> void:
	print("Player Died")


func _on_enemy_died() -> void:
	print("Enemy Died")
