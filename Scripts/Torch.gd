extends Light2D


var toggle_torch


func _ready():
	toggle_torch = true


func toggle_torch():
	if toggle_torch:
		self.enabled = false
		toggle_torch = false
	else:
		self.enabled = true
		toggle_torch = true