extends UnitHandler
class_name EnemyHandler


func start_battle(char_stats: CharacterStats) -> void:
	_create_character(char_stats)
	new_character.sprite_2d.scale.x = -new_character.sprite_2d.scale.x
	draw_cards(character.cards_per_draw)

	#TODO: replace with spawn point
	new_character.global_position = tile_map.convert_id_to_world_position(Vector2i(4,1))


func _set_character(new_character: Unit) -> void:
	new_character.set_script(load("res://scenes/enemy/enemy.gd"))
	new_character.stats = character
	new_character.add_to_group("enemy")
	add_child(new_character)
