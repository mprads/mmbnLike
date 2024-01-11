extends Effect
class_name HealEffect

var amount := 0

func execute(targets: Array[Node]) -> void:
	for target in targets:
		if not target:
			continue

		target.stats.health += amount

