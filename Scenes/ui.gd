extends CanvasLayer

@export var nextLevel: PackedScene = preload("res://Scenes/main_menu.tscn")

var forwards := true
func _physics_process(delta: float) -> void:
	if $Sprite2D.visible:
		var target = 45.0 if forwards else -10.0
		$Sprite2D.texture.noise.cellular_jitter = lerp($Sprite2D.texture.noise.cellular_jitter, target, 0.01)
		if abs($Sprite2D.texture.noise.cellular_jitter - target) < 0.9:
			forwards = !forwards

func _on_game_over_visibility_changed() -> void:
	$Sprite2D.visible = $GameOver.visible
	if not $GameOver.visible and not $Win.visible: return
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true

func _on_win_visibility_changed() -> void:
	$Sprite2D.visible = $Win.visible
	if not $Win.visible: return
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true

func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_continue_pressed() -> void:
	get_tree().paused = false
	get_tree().call_deferred("change_scene_to_file", nextLevel.resource_path)
