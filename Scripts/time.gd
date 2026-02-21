extends RichTextLabel

var ticks: int = 0

func _ready() -> void:
	Stats.game_tick.connect(on_tick)

func on_tick() -> void:
	ticks += 1
	
	if ticks % 4 == 0:
		text = "TIME: " + time_from_ticks()

func time_from_ticks() -> String:
	var minutes := str(floori(ticks / (60 * 4)))
	var seconds := str(floori(ticks / 4) % 60)
	
	if len(seconds) == 1:
		seconds = "0" + seconds
	
	return minutes + ":" + seconds
