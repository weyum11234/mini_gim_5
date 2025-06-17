extends Control

var is_dragging = false
var drag_offset = Vector2()
var original_position = Vector2()

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_dragging = true
				drag_offset = get_local_mouse_position()
				original_position = position
			else:
				is_dragging = false
			position = original_position

func _process(delta: float) -> void:	
	if is_dragging:
		position = get_parent().get_local_mouse_position() - drag_offset

func _on_mouse_entered() -> void:
	z_index = 100
	$Tooltip.show()

func _on_mouse_exited() -> void:
	z_index = 0
	$Tooltip.hide()
