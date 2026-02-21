extends TextureButton

@export var threshold: int = 5 * Stats.TPS
@export var textures: Array[Texture2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Stats.game_tick.connect(on_tick)

func on_tick() -> void:
	if Stats.blink.value <= threshold:
		texture_normal = [textures[1], textures[2]].pick_random()
	else:
		texture_normal = textures[0]

func _on_pressed() -> void:
	Stats.blink.value += 2 * Stats.TPS
