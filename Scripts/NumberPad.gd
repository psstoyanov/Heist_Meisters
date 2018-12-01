extends Popup

onready var display = $VSplitContainer/DisplayContainer/Display
onready var accept_light = $VSplitContainer/ButtonContainer/ButtonGrid/Light

const APPLY_BUTTON = "OK"
var combination = [2, 3, 5]
var guess = []



func _ready():
	connect_buttons()
	reset_lock()

func connect_buttons():
	for button in $VSplitContainer/ButtonContainer/ButtonGrid.get_children():
		if button is Button:
			button.connect("pressed", self, "on_Button_Pressed", [button.text])


func check_guess():
	if guess == combination:
		accept_light.texture = load(Global.green_light)
		$Timer.start()
	else:
		reset_lock()


func entered(button):
	guess.append(button)
	update_display()


func reset_lock():
	guess.clear()
	display.clear()
	accept_light.texture = load(Global.red_light)


func update_display():
	display.bbcode_text = "[center]" + PoolStringArray(guess).join("") + "[/center]"
	


func on_Button_Pressed(button):
	if button == APPLY_BUTTON:
		check_guess()
	else:
		entered(int(button))


func _on_Timer_timeout():
	reset_lock()
	hide()
