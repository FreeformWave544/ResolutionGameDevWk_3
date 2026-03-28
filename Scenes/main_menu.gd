extends Control

var back = false
func _physics_process(_delta: float) -> void:
	$Parallax2D.autoscroll = -(get_local_mouse_position() - Vector2(1152/2, 648/2))
	if $Saph.scale > Vector2(0.1, 0.1) and not back:
		$Saph.scale = lerp($Saph.scale, Vector2(0.0, 0.0), 0.01)
	else:
		back = true
		$Saph.scale = lerp($Saph.scale, Vector2(1.0, 1.0), 0.01)
		if $Saph.scale > Vector2(0.8, 0.8): back = false
