extends "res://Scripts/Door.gd"

var combination

func _on_Door_body_exited(body):
	if not $AnimationPlayer.is_playing():
		if body == Global.Player:
			can_click = false
			$CanvasLayer/NumberPad.hide()


func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/NumberPad.reset_lock()
		$CanvasLayer/NumberPad.popup_centered()

func _on_NumberPad_combination_correct():
	open()


func _on_Computer_combination(received_combination):
	combination = received_combination
	$CanvasLayer/NumberPad.combination = combination


func _on_ExitDetection_body_entered(body):
	open()
