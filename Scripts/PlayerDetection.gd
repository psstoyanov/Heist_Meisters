extends "res://Scripts/Character.gd"

const FOV_TOLERANCE = 20
const RED = Color(1, .25, .25)
const WHITE = Color(1, 1, 1)

# Make this Level Neutral
onready var Player = get_node("/root/Level1/Player")


func _process(delta):
	if Player_is_in_FOV_TOLERANCE():
		$Torch.color = RED
	else:
		$Torch.color = WHITE


func Player_is_in_FOV_TOLERANCE():
	var npc_facing_dir = Vector2(1, 0).rotated(global_rotation)
	var dir_to_Player = (Player.position - global_position).normalized()
	# var dist_to_Player = Player.position - global_position

	
	if abs(dir_to_Player.angle_to(npc_facing_dir)) < deg2rad(FOV_TOLERANCE):
		return true
	else:
		return false