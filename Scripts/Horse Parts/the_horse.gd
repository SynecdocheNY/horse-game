extends Control

@export var player: AudioStreamPlayer
@export var hungry: AudioStream
@export var thirsty: AudioStream
@export var eating: AudioStream

@export var body: TextureRect

@export var talking_sprite: Texture2D
@export var normal_sprite: Texture2D

func _ready() -> void:
	Stats.game_tick.connect(on_tick)

func on_tick() -> void:
	match player.playing:
		true:
			body.texture = talking_sprite
		false:
			body.texture = normal_sprite
	
	if Stats.metabolism.value == 78:
		player.stream = hungry
		player.play()
	
	if Stats.water.value == 80:
		player.stream = thirsty
		player.play()

func on_eating() -> void:
	player.stream = eating
	player.play()
