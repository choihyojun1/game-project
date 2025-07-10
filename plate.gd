extends Area2D

var plate_foods = []

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("food") and body.interactable:
		body.interactable = false
		body.get_parent().remove_child(body)
		add_child(body)
		body.position = Vector2.ZERO
		body.z_index = 2
		plate_foods.append(body.type)

func pickup():
	$CollisionShape2D.disabled = true
	
func putdown():
	$CollisionShape2D.disabled = false
