extends Node ## Global

const TPS: int = 4

var fart := 0 ## Goes up always; fart sound on discharge
var sugar := 0
var salt := 0
var blink: Datum = preload("res://Data/Blink.tres")
## Literally random
var stock_portfolio: Datum = preload("res://Data/Stock Market.tres")
var brush := 0 ## Minigame
var metabolism := 0 ## Hunger
## Pulses, but goes down slowly
var heart_beat: Datum = preload("res://Data/Heartbeat.tres")
var will_to_live := 0 ## Oscillates just above 0
## Equip new shoes
var legs: Datum = preload("res://Data/Legs.tres")
var water := 0

signal game_tick

func _ready() -> void:
	var main_timer := Timer.new()
	add_child(main_timer)
	
	main_timer.start(1.0 / TPS)
	main_timer.autostart = true
	main_timer.timeout.connect(on_tick)

func on_tick() -> void:
	stock_portfolio.value += randi_range(-1,2)
	
	game_tick.emit()

func bottomed_out(failed: Datum) -> void:
	print(failed)
