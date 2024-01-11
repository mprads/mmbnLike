extends Resource
class_name Card

enum Type {TARGETING, HITBOX, POWER}
enum Target {SELF, ENEMY, EVERYONE}
enum Shape {T, L, I, O, X}

@export_group("Card Attributes")
@export var id: String
@export var type: Type
@export var target: Target
@export var grid_shape: Shape


func _get_targets(targets: Array[Node]) -> Array[Node]:
	if not targets:
		return []

	var tree := targets[0].get_tree()

	match target:
		Target.SELF:
			return tree.get_nodes_in_group("player")
		Target.ENEMY:
			return tree.get_nodes_in_group("enemy")
		Target.EVERYONE:
			return tree.get_nodes_in_group("player") + tree.get_nodes_in_group("enemy")
		_:
			return []


func play(targets: Array[Node]) -> void:
	apply_effects(_get_targets(targets))


func apply_effects(_targets: Array[Node]) -> void:
	print("ApplyEffects has not been implemented for: ", self)
