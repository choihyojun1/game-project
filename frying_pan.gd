extends Area2D

var cooking_food: Node2D
var cookable_food = ["meat"]

func _on_body_entered(body: Node2D) -> void:
	if cooking_food:
		return
	if body.is_in_group("food") and body.type in cookable_food and body.interactable:
		cooking_food = body
		body.global_position = global_position
		body.interactable = false
		$CookTimer.start()


func _on_cook_timer_timeout() -> void:
	var cook_result = cooking_food.grill_result.instantiate()
	get_tree().root.add_child(cook_result)
	cook_result.global_position = global_position
	cooking_food.queue_free()
