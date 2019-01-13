extends Node

var Player
var navigation
var destinations

# Asset Links - MUST BE CHANGED MANUALLY
var nightvision_on_sfx = "res://SFX/nightvision.wav"
var nightvision_off_sfx = "res://SFX/nightvision_off.wav"



var red_light = "res://GFX/Interface/PNG/dotRed.png"
var green_light = "res://GFX/Interface/PNG/dotGreen.png"

var button_press_SFX = "res://SFX/twoTone1.ogg"
var combination_correct_SFX = "res://SFX/threeTone1.ogg"

var disguise_box_sprite = "res://GFX/PNG/Tiles/tile_129.png"
var disguise_box_occluder = "res://Scenes/Characters/Box_Occluder.tres"

var player_sprite = "res://GFX/PNG/Hitman 1/hitman1_stand.png"
var character_occluder = "res://Scenes/Characters/Character_Occluder.tres"

var small_box_sprite = "res://GFX/PNG/Tiles/tile_157.png"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
