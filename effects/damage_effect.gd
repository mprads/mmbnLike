extends Effect
class_name DamageEffect

var amount := 0

func execute(targets: Array[Node]) -> void:
	for target in targets:
		if not target:
			continue

		target.take_damage(amount)
