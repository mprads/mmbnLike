extends Resource
class_name Deck

@export var cards: Array[Card] = []


func draw_card() -> Card:
	#TODO: Maybe need a draw pile that is a clone of the deck and pops on pick
	#to prevent having duplicates in the hand
	var card = cards.pick_random()
	return card

func print_cards() -> void:
	var _card_strings: PackedStringArray = []
	for i in range(cards.size()):
		_card_strings.append("%s: %s" % [i+1, cards[i].id])
	#return "\n".join(_card_strings)
	print("\n".join(_card_strings))
