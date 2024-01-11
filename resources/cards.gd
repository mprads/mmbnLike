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

@export_group("Card Visuals")
@export var icon: Texture


func _get_targets(tree: SceneTree) -> Array[Node]:
	if type == Type.TARGETING || type == Type.POWER:
		match target:
			Target.SELF:
				return tree.get_nodes_in_group("player")
			Target.ENEMY:
				return tree.get_nodes_in_group("enemy")
			Target.EVERYONE:
				return tree.get_nodes_in_group("player") + tree.get_nodes_in_group("enemy")
			_:
				return []
	else:
		return []


func play(tree: SceneTree) -> void:
	apply_effects(_get_targets(tree))


func apply_effects(_targets: Array[Node]) -> void:
	print("ApplyEffects has not been implemented for: ", self)
