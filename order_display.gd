extends Node2D

func display_order(index):
	if get_child_count() > 0:
		get_child(0).queue_free()
	var scene = load("res://orders/order" + str(index) + ".tscn")
	var order = scene.instantiate()
	add_child(order)
	order.position = Vector2.ZERO
