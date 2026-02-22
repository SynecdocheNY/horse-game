extends Control

var threshold = 100

@export var mane_sprites: Array[Texture2D]
@export var tail_sprites: Array[Texture2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Stats.game_tick.connect(on_tick)

func on_tick() -> void:
	if Stats.brush.value <= threshold:
		$Mane.texture = [mane_sprites[1], mane_sprites[2]][Stats.tick_number % 2]
		$Tail.texture = [tail_sprites[1], tail_sprites[2]][Stats.tick_number % 2]
	else:
		$Mane.texture = mane_sprites[0]
		$Tail.texture = tail_sprites[0]

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data == "Brush"

func _drop_data(_at_position: Vector2, _data: Variant) -> void:
	Stats.brush.value += 100
