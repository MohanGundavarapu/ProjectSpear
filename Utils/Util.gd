extends Node

# Global Script
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# Runs every frame
func _process(_delta):
	if Input.is_action_pressed("Quit"):
		get_tree().quit()
#		if get_tree().current_scene.get_name() != "TitleScene":
#			get_tree().change_scene_to_file("res://Scenes/title_scene.tscn")

