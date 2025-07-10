extends Node2D


func _ready() -> void:
	$CanvasLayer/ScoreLabel.text = "Total Score: " + str(GameManager.total_score)
