extends Node2D

var text


func get_json():
	var file = File.new()
	file.open(Global.tutorial_messages, file.READ)
	var content = file.get_as_text()
	file.close()
	return parse_json(content)



func _ready():
	add_to_group("interface")
	text = get_json()
	update_pointer_position(0)
	$TutorialGUI.get_child(0).show()
	

func update_pointer_position(number):
	var pointer = $ObjectivePointer
	var marker = $ObjectiveMarkers.get_child(number)
	$AudioStreamPlayer.play()
	$Tween.interpolate_property(pointer, "position", pointer.position,
			 marker.position, 2.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()
	$TutorialGUI/Popup/NinePatchRect/RichTextLabel.bbcode_text = text[str(number)]


func _on_ObjectiveMove_body_entered(body):
	update_pointer_position(1)


func _on_ObjectiveDoor_body_entered(body):
	update_pointer_position(2)
	

func _on_ObjectiveLockedDoor_body_entered(body):
	update_pointer_position(3)
	Darkvision_Mode()

func _on_ObjectiveComputer_body_entered(body):
	update_pointer_position(4)
	Darkvision_Mode()

func _on_ObjectiveUnlockedDoor_body_entered(body):
	update_pointer_position(5)

func _on_ObjectiveCamera_body_entered(body):
	update_pointer_position(6)


func _on_ObjectiveGuard_body_entered(body):
	update_pointer_position(7)
	

func _on_ObjectiveLoot_body_entered(body):
	update_pointer_position(8)

func Nightvision_Mode():
	$TutorialGUI/Popup.hide()

func Darkvision_Mode():
	$TutorialGUI/Popup.show()



func _on_Briefcase_body_entered(body):
	$TutorialGUI/Popup/NinePatchRect/RichTextLabel.bbcode_text = text[str(9)]
