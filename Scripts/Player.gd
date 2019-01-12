extends "res://Scripts/Character.gd"


var motion = Vector2()
var vision_mode_on_cooldown = false

var disguised = false

enum vision_mode {DARK, NIGHTVISION}


func _ready():
	Global.Player = self
	vision_mode = DARK


func _process(delta):
	update_motion(delta)
	
	move_and_slide(motion)


func update_motion(delta):
	if Input.is_action_pressed("ui_up"):
		motion.y = -SPEED
	elif Input.is_action_pressed("ui_down"):
		motion.y = SPEED
	else:
		motion.y = lerp(motion.y, 0, FRICTION)
	
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	else:
		motion.x = lerp(motion.x, 0, FRICTION)
	
	if motion.length() > SPEED:
		motion = motion.normalized() * SPEED
	
	# Look at the movement direction
	look_at(get_global_mouse_position())


func _input(event):
	if Input.is_action_pressed("vision_mode") and not vision_mode_on_cooldown:
		cycle_vision_mode()
		vision_mode_on_cooldown = true
		$VisionModeTimer.start()
	if Input.is_action_just_pressed("toggle_disguise"):
		toggle_disguise()


func toggle_disguise():
	if disguised:
		reveal()
	else:
		disguise()


func cycle_vision_mode():
	if vision_mode == DARK:
		get_tree().call_group("interface","Nightvision_Mode")
		vision_mode = NIGHTVISION
	elif vision_mode == NIGHTVISION:
		get_tree().call_group("interface","Darkvision_Mode")
		vision_mode = DARK


func _on_VisionModeTimer_timeout():
	vision_mode_on_cooldown = false


func disguise():
	$Sprite.texture = load(Global.disguise_box_sprite)
	$Light2D.texture = load(Global.disguise_box_sprite)
	$LightOccluder2D.occluder = load(Global.disguise_box_occluder)
	collision_layer = 16
	disguised = true


func reveal():
	$Sprite.texture = load(Global.player_sprite)
	$Light2D.texture = load(Global.player_sprite)
	$LightOccluder2D.occluder = load(Global.character_occluder)
	collision_layer = 1
	disguised = false
