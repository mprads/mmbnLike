extends Stats
class_name CharacterStats

@export var starting_deck: Deck
@export var cards_per_draw: int

var deck: Deck


func create_instance() -> Resource:
	var instance: CharacterStats = self.duplicate()
	instance.health = max_health
	instance.block = 0
	instance.deck = instance.starting_deck.duplicate()

	return instance
