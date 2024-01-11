extends Control
class_name CardUI

@export var card: Card : set = _set_card

@onready var panel: Panel = $Panel
@onready var cost: Label = $Name
@onready var icon: TextureRect = $Icon


func play() -> void:
	if not card:
		return

	card.play()
	queue_free()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("use_slot_1") && self.get_index() == 0:
		play()
	elif event.is_action_pressed("use_slot_2") && self.get_index() == 1:
		play()
	elif event.is_action_pressed("use_slot_3") && self.get_index() == 2:
		play()
	elif event.is_action_pressed("use_slot_4") && self.get_index() == 3:
		play()


func _set_card(value: Card) -> void:
	if not is_node_ready():
		await ready

	card = value
	cost.text = str(card.id)
	icon.texture = card.icon
