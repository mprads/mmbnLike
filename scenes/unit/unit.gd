extends CharacterBody2D
class_name Unit

@export var stats: CharacterStats : set = set_character_stats

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var stats_ui: StatsUI = $StatsUI
@onready var hand: Hand = $Hand


func set_character_stats(value: CharacterStats) -> void:
	stats = value

	#Ensures the player node is ready so there is no blinking of the UI
	if not stats.stats_changed.is_connected(update_stats):
		stats.stats_changed.connect(update_stats)

	update_player()

func update_player() -> void:
	if not stats is CharacterStats:
		return
	if not is_inside_tree():
		await ready

	sprite_2d.texture = stats.art
	update_stats()


func update_stats():
	stats_ui.update_stats(stats)

func take_damage(damage: int) -> void:
	if stats.health <= 0:
		return

	stats.take_damage(damage)

	if stats.health <= 0:
		queue_free()
		_die()


func move(pos: Vector2) -> void:
	global_position = pos


func _ready() -> void:
	if not stats_ui.is_node_ready():
		await stats_ui.ready

	stats_ui.set_max_value(stats)


func _die() -> void:
	print("_Die has not been implemented for: ", self)
