extends TextureRect

var main_scene: PackedScene = preload("res://Scenes/main_scene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer := get_tree().create_timer(5.0)
	timer.timeout.connect(back_to_main)

func back_to_main() -> void:
	get_tree().change_scene_to_packed(main_scene)
