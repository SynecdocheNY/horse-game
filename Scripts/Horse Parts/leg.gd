extends Control

@export var texture_rect: TextureRect
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
		
		texture_rect.texture = [textures[1], textures[2]][Stats.tick_number % 2]
	else:
		texture_rect.texture = textures[0]

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data == "Horseshoe" and ticks_until_break <= 0

func _drop_data(_at_position: Vector2, _data: Variant) -> void:
	# Fix leg
	ticks_until_break = randi_range(5 * Stats.TPS, 60 * Stats.TPS)
	Stats.legs.value += 1
