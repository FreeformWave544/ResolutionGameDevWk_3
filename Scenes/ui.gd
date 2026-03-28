extends CanvasLayer

func _on_game_over_visibility_changed() -> void:
	if not $GameOver.visible: return
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true

func _on_win_visibility_changed() -> void:
	if not $Win.visible: return
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true

func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().quit()
