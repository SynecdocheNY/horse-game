extends TextureButton

@export var threshold: int = 5 * Stats.TPS
@export var textures: Array[Texture2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Stats.game_tick.connect(on_tick)

func on_tick() -> void:
	if Stats.tick_number % 4 in [2,3]:
		Stats.heart_beat.value -= 2
	
	if Stats.heart_beat.value <= threshold:
		texture_normal = [textures[1], textures[2]][Stats.tick_number % 2]
	else:
		texture_normal = textures[0]

func _on_pressed() -> void:
	Stats.heart_beat.value += 5 * Stats.TPS
