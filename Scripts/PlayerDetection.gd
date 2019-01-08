extends "res://Scripts/Character.gd"

const FOV_TOLERANCE = 20
const RED = Color(1, .25, .25)
const WHITE = Color(1, 1, 1)
const MAX_DETECTION_RANGE = 340

# Make this Level Neutral
onready var Player = Global.Player

func _ready():
	add_to_group("NPC")

func _process(delta):
	if Player_is_in_FOV_TOLERANCE() and Player_is_on_LOS():
		if $Torch:
			$Torch.color = RED
			get_tree().call_group("SuspicionMeter", "player_seen")
		else:
			print(String(self.name) + " Torch is missing")
	else:
		if $Torch:
			$Torch.color = WHITE
		else:
			print(String(self.name) + " Torch is missing")


func Player_is_in_FOV_TOLERANCE():
	var npc_facing_dir = Vector2(1, 0).rotated(global_rotation)
	var dir_to_Player = (Player.position - global_position).normalized()

	if abs(dir_to_Player.angle_to(npc_facing_dir)) < deg2rad(FOV_TOLERANCE):
		return true
	else:
		return false


func Player_is_on_LOS():
	var space = get_world_2d().direct_space_state
	var LOS_obstacle = space.intersect_ray(global_position, Player.global_position, [self], collision_mask)
	
	var distance_to_Player = Player.global_position.distance_to(global_position)
	var Player_in_range = distance_to_Player < MAX_DETECTION_RANGE
	
	if LOS_obstacle.collider == Player and Player_in_range:
		return true
	else:
		return false


func Nightvision_Mode():
	if $Torch:
		$Torch.enabled = false
	else:
		print(String(self.name) + " doesn't have a torch")


func Darkvision_Mode():
	if $Torch:
		$Torch.enabled = true
	else:
		print(String(self.name) + " doesn't have a torch")


