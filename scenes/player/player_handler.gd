extends UnitHandler
class_name PlayerHandler


func start_battle(char_stats: CharacterStats) -> void:
	_create_character(char_stats)
	new_character.add_to_group("player")
	draw_cards(character.cards_per_draw)

	#TODO: replace with spawn point
	new_character.global_position = tile_map.convert_id_to_world_position(Vector2i(1,1))

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
		new_character.hand.get_child(0).play(get_tree())
	elif event.is_action_pressed("use_slot_2"):
		new_character.hand.get_child(1).play(get_tree())
	elif event.is_action_pressed("use_slot_3"):
		new_character.hand.get_child(2).play(get_tree())
	elif event.is_action_pressed("use_slot_4"):
		new_character.hand.get_child(3).play(get_tree())
