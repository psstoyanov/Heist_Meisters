extends CanvasModulate

const DARK = Color("3a4897")
const NIGHTVISION = Color("00ac6b")


func _ready():
	add_to_group("interface")
	color = DARK


func Nightvision_Mode():
	color = NIGHTVISION
	play_sfx(Global.nightvision_on_sfx)


func Darkvision_Mode():
	color = DARK
	play_sfx(Global.nightvision_off_sfx)


func play_sfx(nightvision_sfx):
	$AudioStreamPlayer.stream = load(nightvision_sfx)
	$AudioStreamPlayer.play()