extends StaticBody2D

@export var food: PackedScene

func interact():
	var node = food.instantiate()
	get_tree().root.add_child(node)
	node.global_position = global_position
