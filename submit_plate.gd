extends Area2D

var recipes: Array = []
var scores: Array = []

var total_score: int = 0

func _ready() -> void:
	var recipe = ["meat", "cooked_meat"]
	recipe.sort()
	recipes.append(recipe)
	scores.append(100)
	
	recipe = ["meat"]
	recipe.sort()
	recipes.append(recipe)
	scores.append(50)
	
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("plate"):
		var submitted = area.plate_foods
		submitted.sort()
		
		var recipe_found: bool = false
		var recipe_idx: int = 0
		for i in len(recipes):
			if submitted == recipes[i]:
				recipe_found = true
				recipe_idx = i
				break
				
		if recipe_found:
			total_score += scores[recipe_idx]
			print("Recipe matched! " + str(total_score))
		else:
			print("No matching recipe found.")
		
		area.queue_free()
