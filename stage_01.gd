extends Node2D

@export var game_time: int = 60
var current_time: int = 0

func _ready():
	$HUD/ProgressBar.max_value = game_time

func _on_game_timer_timeout() -> void:
	current_time += 1
	if current_time > game_time:
		GameManager.total_score = $SubmitPlate.total_score
		get_tree().change_scene_to_file("res://game_over.tscn")
	$HUD/ProgressBar.value = current_time
