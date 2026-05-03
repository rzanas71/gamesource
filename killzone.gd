extends Area2D

func _on_body_entered(body: Node2D):

	if body.has_method("die"):

		Engine.time_scale = 0.5

		body.die()

		body.get_node("CollisionShape2D").queue_free()

		$game_over_sound.play()

		$Timer.start()


func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
