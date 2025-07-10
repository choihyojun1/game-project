extends CharacterBody2D

const SPEED = 300.0
var held_food: Node2D = null
var look_dir := Vector2.RIGHT  # 초기 방향

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down")
	if dir != Vector2.ZERO:
		look_dir = dir.normalized()  # 방향 저장
	$InteractArea.position = look_dir * 12
	$UseArea.position = look_dir * 12
	velocity = dir * SPEED
	
	if Input.is_action_just_pressed("interact"):
		if held_food:
			drop_food()
		else:
			$InteractArea.monitoring = true
			$InteractTimer.start()
	if Input.is_action_just_pressed("use") and not held_food:
		$UseArea.monitoring = true
		$UseTimer.start()

	if held_food:
		var offset = look_dir * 32  # 캐릭터 앞쪽 위치 (픽셀 수 조절 가능)
		held_food.global_position = global_position + offset

	move_and_slide()


func _grab_or_interact(body: Node2D) -> void:
	if held_food:
		return
		
	if body.is_in_group("food") and body.interactable:  # 음식만 들 수 있게
		pick_up_food(body)
	if body.is_in_group("interactable"):
		body.interact()

func _interact(body: Node2D) -> void:
	print(body.name + " interacted!")

func _on_interact_timer_timeout() -> void:
	$InteractArea.monitoring = false


func pick_up_food(food: Node2D) -> void:
	held_food = food
	food.get_parent().remove_child(food)
	add_child(food)
	food.z_index = 1


func drop_food() -> void:
	if held_food:
		held_food.get_parent().remove_child(held_food)
		get_parent().add_child(held_food)
		held_food.global_position = global_position + look_dir * 32
		held_food = null


func _on_use_timer_timeout() -> void:
	$UseArea.monitoring = false
