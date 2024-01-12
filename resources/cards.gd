extends Resource
class_name Card

signal require_hitbox_target

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


func _get_targets(character: Unit) -> Array[Node]:
	if type == Type.TARGETING || type == Type.POWER:
		match target:
			Target.SELF:
				return character.get_tree().get_nodes_in_group("player")
			Target.ENEMY:
				return character.get_tree().get_nodes_in_group("enemy")
			Target.EVERYONE:
				return character.get_tree().get_nodes_in_group("player") + character.get_tree().get_nodes_in_group("enemy")
			_:
				return []
	elif type == Type.HITBOX:
		return [character.get_target_from_raycast()]
	else:
		return []


func play(character: Unit) -> void:
	apply_effects(_get_targets(character))


func apply_effects(_targets: Array[Node]) -> void:
	print("ApplyEffects has not been implemented for: ", self)
