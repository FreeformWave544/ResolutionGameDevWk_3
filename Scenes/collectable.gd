extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.score += 1
		body._update_UI()
		set_deferred("monitoring", false)
		finalCountdown()

func finalCountdown():
	$Pickup.play()
	$Particles.process_material.initial_velocity_max = 1000.0
	await get_tree().create_timer(5.0).timeout

	while $Particles.process_material.emission_ring_radius < 900:
		$Particles.process_material.emission_ring_radius = lerp($Particles.process_material.emission_ring_radius, 1000.0, 0.01)
		if not is_inside_tree(): return
		await get_tree().process_frame
	if not is_inside_tree(): return
	await get_tree().create_timer(1.0).timeout

	while $Particles.process_material.emission_ring_inner_radius < 900:
		$Particles.process_material.emission_ring_inner_radius = lerp($Particles.process_material.emission_ring_inner_radius, 1000.0, 0.01)
		if not is_inside_tree(): return
		await get_tree().process_frame

	while modulate.a > 0.15:
		modulate.a = lerp(modulate.a, 0.1, 0.1)
		if not is_inside_tree(): return
		await get_tree().process_frame

	# RESET:
	$Particles.process_material.initial_velocity_max = 50.0
	while $Particles.process_material.emission_ring_radius > 33.0:
		$Particles.process_material.emission_ring_radius = lerp($Particles.process_material.emission_ring_radius, 32.0, 0.1)
		if not is_inside_tree(): return
		await get_tree().process_frame
	$Particles.process_material.emission_ring_radius = 32.0
	if not is_inside_tree(): return
	await get_tree().create_timer(0.5).timeout

	while $Particles.process_material.emission_ring_inner_radius > 33.0:
		$Particles.process_material.emission_ring_inner_radius = lerp($Particles.process_material.emission_ring_inner_radius, 32.0, 0.1)
		if not is_inside_tree(): return
		await get_tree().process_frame
	$Particles.process_material.emission_ring_inner_radius = 32.0
