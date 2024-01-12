extends Unit
class_name Enemy


func _die() -> void:
	Events.enemy_died.emit()
