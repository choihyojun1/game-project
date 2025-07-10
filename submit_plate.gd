extends Area2D

var recipes: Array = []
var scores: Array = []

var total_score: int = 0
var target_recipe: int = 0

func _ready() -> void:
	var recipe = ["chicken"]
	recipe.sort()
	recipes.append(recipe)
	scores.append(50)
	
	recipe = ["cooked_chicken"]
	recipe.sort()
	recipes.append(recipe)
	scores.append(100)
	
	recipe = ["bacon"]
	recipe.sort()
	recipes.append(recipe)
	scores.append(50)
	
	recipe = ["cooked_bacon"]
	recipe.sort()
	recipes.append(recipe)
	scores.append(100)
	
	recipe = ["meat"]
	recipe.sort()
	recipes.append(recipe)
	scores.append(50)
	
	recipe = ["meat", "cooked_meat"]
	recipe.sort()
	recipes.append(recipe)
	scores.append(100)
	
	new_order()
	
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("plate"):
		var submitted = area.plate_foods
		submitted.sort()
		
		if recipes[target_recipe-1] == submitted:
			total_score += scores[target_recipe-1]
			print('성공!')
		else:
			print('실패...')
		
		$"../HUD/ScoreLabel".text = str(total_score)
		
		area.queue_free()
		new_order()
		
func new_order():
	target_recipe = randi_range(1, len(recipes))
	$"../OrderDisplay".display_order(target_recipe)

#func check_recipe(submitted):
	#var recipe_found: bool = false
	#var recipe_idx: int = 0
	#for i in len(recipes):
		#if submitted == recipes[i]:
			#recipe_found = true
			#recipe_idx = i
			#break
			#
	#if recipe_found:
		#total_score += scores[recipe_idx]
		#print("Recipe matched! " + str(total_score))
	#else:
		#print("No matching recipe found.")
