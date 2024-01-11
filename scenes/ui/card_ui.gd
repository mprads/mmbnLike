extends Control
class_name CardUI

@export var card: Card : set = _set_card

@onready var panel: Panel = $Panel
@onready var cost: Label = $Name
@onready var icon: TextureRect = $Icon


func play(tree: SceneTree) -> void:
	if not card:
		return

	card.play(tree)
	queue_free()


func _set_card(value: Card) -> void:
	if not is_node_ready():
		await ready

	card = value
	cost.text = str(card.id)
	icon.texture = card.icon
