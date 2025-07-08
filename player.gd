extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down")
	
	velocity = dir * SPEED
	
	if Input.is_action_just_pressed("interact"):
		$Area2D.monitoring = true
		$InteractTimer.start()

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	add_child(body)
	print(body.name)


func _on_interact_timer_timeout() -> void:
	$Area2D.monitoring = false
