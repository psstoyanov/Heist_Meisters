extends Node2D


func _ready():
	update_pointer_position()

func update_pointer_position():
	var pointer = $ObjectivePointer
	var marker = $ObjectiveMarkers.get_child(0)
	$AudioStreamPlayer.play()
	$Tween.interpolate_property(pointer, "position", pointer.position,
			 marker.position, 2.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()
	$ObjectiveMarkers.remove_child(marker)


func _on_ObjectiveMove_body_entered(body):
	update_pointer_position()


func _on_ObjectiveDoor_body_entered(body):
	update_pointer_position()


func _on_ObjectiveLockedDoor_body_entered(body):
	update_pointer_position()


func _on_ObjectiveComputer_body_entered(body):
	update_pointer_position()


func _on_ObjectiveCamera_body_entered(body):
	update_pointer_position()


func _on_ObjectiveGuard_body_entered(body):
	update_pointer_position()


func _on_ObjectiveLoot_body_entered(body):
	update_pointer_position()


func _on_ObjectiveExit_body_entered(body):
	update_pointer_position()
