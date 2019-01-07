extends Popup

func set_text(combination):
	$TextOnDisplay.bbcode_text = ("Will you stop forgetting your access code?\n\nI've set it to:\n" 
			+ PoolStringArray(combination).join("") 
			+ "\n\nBut this is the last time!")