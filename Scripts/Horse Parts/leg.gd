extends TextureRect

@export var textures: Array[Texture2D]

var ticks_until_break: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Stats.game_tick.connect(on_tick)
	
	ticks_until_break = randi_range(5 * Stats.TPS, 60 * Stats.TPS)

func on_tick() -> void:
	ticks_until_break -= 1
	
	if ticks_until_break <= 0:
		if ticks_until_break == 0:
			Stats.legs.value -= 1
		
		texture = [textures[1], textures[2]].pick_random()
	else:
		texture = textures[0]
