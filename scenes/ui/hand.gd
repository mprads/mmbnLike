extends HBoxContainer
class_name Hand

@onready var card_ui:= preload("res://scenes/ui/card_ui.tscn")

func add_card(card: Card) -> void:
	var new_card_ui := card_ui.instantiate()
	add_child(new_card_ui)
	new_card_ui.card = card
