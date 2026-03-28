extends Node2D

func _physics_process(_delta: float) -> void:
	$Parallax2D/Sprite2D2.texture.noise.fractal_ping_pong_strength += 1
	$Parallax2D/Sprite2D2.texture.noise.cellular_jitter += 1

func _on_deathzone_body_entered(body: Node2D) -> void:
	if body is Player:
		$UI/GameOver.show()
