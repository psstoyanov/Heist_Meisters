extends CanvasLayer



func _on_TryAgain_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")


func _on_Quit_pressed():
	get_tree().change_scene("res://Scenes/Levels/SplashScreen.tscn")
