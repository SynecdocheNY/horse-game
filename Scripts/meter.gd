extends TextureProgressBar

@export var datum: Datum:
	set(setting):
		datum = setting
		
		min_value = datum.min
		max_value = datum.max
		value = datum.value

func _ready() -> void:
	Stats.game_tick.connect(on_tick)
	Stats.game_tick.connect(datum.on_tick)

func on_tick() -> void:
	value = datum.value
