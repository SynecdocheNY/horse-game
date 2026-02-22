extends Control

var game_scene: PackedScene = preload("res://Scenes/game.tscn")

func _unhandled_key_input(event: InputEvent) -> void:
	to_game()

func to_game() -> void:
	Stats.start_game()
	get_tree().change_scene_to_packed(game_scene)
