class_name Datum extends Resource

@export var min: int = 0
@export var max: int = 100

@export var value: int = 100:
	set(setting):
		value = clampi(setting, min, max)
@export var delta: int = -1

signal reached_min

func on_tick() -> void:
	value += delta
	
	if value <= min:
		reached_min.emit()
