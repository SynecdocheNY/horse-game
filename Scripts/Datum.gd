class_name Datum extends Resource

@export var min: int = 0
@export var max: int = 100

@export var value: int = 100
@export var delta: int = -1

func on_tick() -> void:
	value += delta
	
	if value <= min:
		Stats.bottomed_out(self)
	
	if value > max:
		Stats.overflow(self)
