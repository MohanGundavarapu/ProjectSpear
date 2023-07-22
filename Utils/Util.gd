extends Node

# Global Script

# Runs every frame
func _process(_delta):
	if Input.is_action_pressed("Quit"):
		get_tree().quit()

