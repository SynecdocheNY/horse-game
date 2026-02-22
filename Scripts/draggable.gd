extends TextureRect

func _get_drag_data(at_position: Vector2) -> Variant:
	var preview = self.duplicate()
	var center = Control.new()
	center.add_child(preview)
	preview.position = -preview.size / 2 # Center the damn thing
	preview.modulate.a = 0.5
	set_drag_preview(center)
	
	return self.name
