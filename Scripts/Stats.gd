extends Node ## Global

const TPS: int = 4

var fart := 0 ## Goes up always; fart sound on discharge
var sugar := 0
var salt := 0
var blink: Datum = preload("res://Data/Blink.tres")
var stock_portfolio := 0 ## Literally random
var brush := 0 ## Minigame
var metabolism := 0 ## Hunger
## Pulses, but goes down slowly
var heart_beat: Datum = preload("res://Data/Heartbeat.tres")
var will_to_live := 0 ## Oscillates just above 0
var fashion := 0 ## Equip new shoes
var water := 0

signal game_tick

func _ready() -> void:
	var main_timer := Timer.new()
	add_child(main_timer)
	
	main_timer.start(1.0 / TPS)
	main_timer.autostart = true
	main_timer.timeout.connect(on_tick)

func on_tick() -> void:
	game_tick.emit()
