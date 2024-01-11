extends TileMap


func convert_world_position_to_id(pos: Vector2) -> Vector2i:
	return local_to_map(pos - global_position)


func convert_id_to_world_position(id: Vector2i) -> Vector2:
	return map_to_local(id) + global_position
