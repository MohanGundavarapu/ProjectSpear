extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("Up"):
		$Start.button_pressed = true
		$Quit.button_pressed = false
	if Input.is_action_just_pressed("Down"):
		$Start.button_pressed = false
		$Quit.button_pressed = true
		
	if Input.is_action_just_pressed("Dash"):
		if $Start.button_pressed == true:
			get_tree().change_scene_to_file("res://Scenes/world.tscn")
		elif $Quit.button_pressed == true:
			get_tree().quit()
