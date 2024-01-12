extends Control
class_name CardUI

@export var card: Card : set = _set_card

@onready var panel: Panel = $Panel
@onready var cost: Label = $Name
@onready var icon: TextureRect = $Icon


func play(character: Unit) -> void:
	if not card:
		return

	card.play(character)
	#TODO: instead of queue free'ing show a disabled version so the indexes do not change
	queue_free()


func _set_card(value: Card) -> void:
	if not is_node_ready():
		await ready

	card = value
	cost.text = str(card.id)
	icon.texture = card.icon
