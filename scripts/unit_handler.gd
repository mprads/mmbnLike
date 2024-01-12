extends Node2D
class_name UnitHandler

@onready var tile_map: TileMap = $"../TileMap"

const HAND_DRAW_INTERVAL := 0.25
const UNIT := preload("res://scenes/player/player.tscn")

var character: CharacterStats
var new_character: Player


func draw_cards(amount: int) -> void:
	var tween := create_tween()
	for i in range(amount):
		tween.tween_callback(draw_card)
		tween.tween_interval(HAND_DRAW_INTERVAL)


func draw_card() -> void:
	new_character.hand.add_card(character.deck.draw_card())


func _create_character(char_stats: CharacterStats) -> void:
	character = char_stats
	new_character = UNIT.instantiate()
	new_character.stats = character
	add_child(new_character)


func _handle_move(dir: Vector2) -> void:
	var tile_pos: Vector2 = new_character.global_position + (dir * tile_map.tile_set.tile_size.x)
	var valid_tile := _check_tile(tile_pos)

	if valid_tile:
		new_character.move(tile_pos)


func _check_tile(pos: Vector2) -> bool:
	var id = tile_map.convert_world_position_to_id(pos)
	var ids = tile_map.get_used_cells_by_id(0)

	return ids.has(id)
