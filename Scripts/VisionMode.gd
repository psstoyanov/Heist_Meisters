extends CanvasModulate

const DARK = Color("3a4897")
const NIGHTVISION = Color("00ac6b")


func _ready():
	add_to_group("interface")
	Darkvision_Mode()


func Nightvision_Mode():
	color = NIGHTVISION
	play_sfx(Global.nightvision_on_sfx)
	inform_NPC("Nightvision_Mode")
	get_tree().call_group("labels", "show")

func Darkvision_Mode():
	color = DARK
	play_sfx(Global.nightvision_off_sfx)
	inform_NPC("Darkvision_Mode")
	get_tree().call_group("labels", "hide")

func play_sfx(nightvision_sfx):
	$AudioStreamPlayer.stream = load(nightvision_sfx)
	$AudioStreamPlayer.play()


func inform_NPC(vision_mode):
	get_tree().call_group("NPC",vision_mode)