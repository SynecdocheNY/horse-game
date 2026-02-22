extends Control

signal eating

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data in ["Water", "Salt", "Sugar", "Food"]

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	match data:
		"Water":
			Stats.water.value += 20 * Stats.TPS
		"Salt":
			Stats.salt.value += 40 * Stats.TPS
		"Sugar":
			Stats.sugar.value += 35 * Stats.TPS
		"Food":
			Stats.metabolism.value += 25 * Stats.TPS
			eating.emit()
