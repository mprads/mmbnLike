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


func _get_targets() -> Array[Node]:

	match target:
		Target.SELF:
			return []
			#return tree.get_nodes_in_group("player")
		Target.ENEMY:
			return []
			#return tree.get_nodes_in_group("enemy")
		Target.EVERYONE:
			return []
			#return tree.get_nodes_in_group("player") + tree.get_nodes_in_group("enemy")
		_:
			return []


func play() -> void:
	apply_effects(_get_targets())


func apply_effects(_targets: Array[Node]) -> void:
	print("ApplyEffects has not been implemented for: ", self)
