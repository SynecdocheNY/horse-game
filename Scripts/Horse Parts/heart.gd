extends TextureButton

@export var threshold: int = 5 * Stats.TPS
@export var textures: Array[Texture2D]

var tick_num: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Stats.game_tick.connect(on_tick)

func on_tick() -> void:
	tick_num += 1
	
	if tick_num % 4 in [2,3]:
		Stats.heart_beat.value -= 2
	
	if Stats.heart_beat.value <= threshold:
		texture_normal = [textures[1], textures[2]].pick_random()
	else:
		texture_normal = textures[0]

func _on_pressed() -> void:
	Stats.heart_beat.value += 5 * Stats.TPS
