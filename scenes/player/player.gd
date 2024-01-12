extends Unit
class_name Player


func _die() -> void:
	Events.player_died.emit()


func get_target_from_raycast() -> Unit:
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(global_position, global_position + Vector2(500, 0))
	var result = space_state.intersect_ray(query)

	if not result.is_empty():
		return result["collider"]
	else:
		return null


func basic_attack() -> void:
	if not stats:
		return

	var target = get_target_from_raycast()

	if not target:
		return

	target.take_damage(stats.basic_attack_damage)
