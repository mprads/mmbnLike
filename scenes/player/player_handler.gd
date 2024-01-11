extends Node2D
class_name PlayerHandler

@onready var tile_map: TileMap = $"../TileMap"

const HAND_DRAW_INTERVAL := 0.25
const PLAYER := preload("res://scenes/player/player.tscn")

var character: CharacterStats
var player_character: Player


func start_battle(char_stats: CharacterStats) -> void:
	character = char_stats
	player_character = PLAYER.instantiate()
	player_character.stats = character
	player_character.add_to_group("player")
	add_child(player_character)
	draw_cards(character.cards_per_draw)

	#TODO: replace with spawn point
	player_character.global_position = tile_map.convert_id_to_world_position(Vector2i(1,1))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left"):
		_handle_move(Vector2.LEFT)
	elif event.is_action_pressed("right"):
		_handle_move(Vector2.RIGHT)
	elif event.is_action_pressed("up"):
		_handle_move( Vector2.UP)
	elif event.is_action_pressed("down"):
		_handle_move(Vector2.DOWN)

	if event.is_action_pressed("use_slot_1"):
		player_character.hand.get_child(0).play(get_tree())
	elif event.is_action_pressed("use_slot_2"):
		player_character.hand.get_child(1).play(get_tree())
	elif event.is_action_pressed("use_slot_3"):
		player_character.hand.get_child(2).play(get_tree())
	elif event.is_action_pressed("use_slot_4"):
		player_character.hand.get_child(3).play(get_tree())


func draw_cards(amount: int) -> void:
	var tween := create_tween()
	for i in range(amount):
		tween.tween_callback(draw_card)
		tween.tween_interval(HAND_DRAW_INTERVAL)


func draw_card() -> void:
	player_character.hand.add_card(character.deck.draw_card())


func _handle_move(dir: Vector2) -> void:
	var tile_pos: Vector2 = player_character.global_position + (dir * tile_map.tile_set.tile_size.x)
	var valid_tile := _check_tile(tile_pos)

	if valid_tile:
		player_character.move(tile_pos)


func _check_tile(pos: Vector2) -> bool:
	var id = tile_map.convert_world_position_to_id(pos)
	var ids = tile_map.get_used_cells_by_id(0)

	return ids.has(id)
