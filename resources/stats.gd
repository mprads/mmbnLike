extends Resource
class_name Stats

signal stats_changed

@export var name: String
@export var max_health := 2
@export var art: Texture
@export var basic_attack_damage:= 5

var health: int : set = set_health
var block: int : set = set_block


func set_health(value: int) -> void:
	health = clampi(value, 0, max_health)
	stats_changed.emit()

func set_block(value: int) -> void:
	block = clampi(value, 0, (max_health / 2))
	stats_changed.emit()

func take_damage(damage: int) -> void:
	if damage <= 0:
		return

	var initial_damage = damage
	damage = clampi(damage - block, 0, damage)
	self.block = clampi(block - initial_damage, 0, block)
	self.health -= damage


func heal(amount: int) -> void:
	self.health += amount


func create_instance() -> Resource:
	var instance: Stats = self.duplicate()
	instance.health = max_health
	instance.block = 0
	return instance
