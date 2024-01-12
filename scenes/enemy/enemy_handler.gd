extends UnitHandler
class_name EnemyHandler


func start_battle(char_stats: CharacterStats) -> void:
	_create_character(char_stats)
	new_character.add_to_group("enemy")
	draw_cards(character.cards_per_draw)

	#TODO: replace with spawn point
	new_character.global_position = tile_map.convert_id_to_world_position(Vector2i(4,1))
