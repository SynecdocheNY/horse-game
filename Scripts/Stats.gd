extends Node ## Global

const TPS: int = 4

var fart := 0
var sugar: Datum = preload("res://Data/Sugar.tres")
var salt: Datum = preload("res://Data/Salt.tres")
var blink: Datum = preload("res://Data/Blink.tres")
var stock_portfolio: Datum = preload("res://Data/Stock Market.tres")
var brush: Datum = preload("res://Data/Brush.tres")
var metabolism: Datum = preload("res://Data/Metabolism.tres")
var heart_beat: Datum = preload("res://Data/Heartbeat.tres")
var will_to_live: Datum = preload("res://Data/Will to Live.tres")
var legs: Datum = preload("res://Data/Legs.tres")
var water: Datum = preload("res://Data/Water.tres")

var game_over: PackedScene = preload("res://Scenes/game_over.tscn")

var main_timer: Timer
var tick_number: int = 0

signal game_tick

func start_game() -> void:
	reset_stats()
	
	main_timer = Timer.new()
	add_child(main_timer)
	
	main_timer.start(1.0 / TPS)
	main_timer.autostart = true
	main_timer.timeout.connect(on_tick)

func end_game() -> void:
	main_timer.timeout.disconnect(on_tick)
	main_timer.queue_free()

func reset_stats() -> void:
	blink.value = 40
	brush.value = 200
	heart_beat.value = 100
	legs.value = 4
	metabolism.value = 80
	salt.value = 100
	stock_portfolio.value = 0
	sugar.value = 120
	water.value = 160
	will_to_live.value = 20

func on_tick() -> void:
	tick_number += 1
	
	stock_portfolio.value += randi_range(-1,2)
	will_to_live.value = randi_range(will_to_live.min + 1, will_to_live.max)
	
	game_tick.emit()

func bottomed_out(failed: Datum) -> void:
	if failed in [metabolism, water, blink, heart_beat, sugar, salt, legs]:
		get_tree().change_scene_to_packed(game_over)
		end_game()

func overflow(failed: Datum) -> void:
	print(failed)
