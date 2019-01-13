extends "res://Scripts/Character.gd"

# How many disguises you start with
export var disguises = 3
# How long disguise can last in seconds
export var disguise_duration = 5

export var disguise_slow_down = 0.25

var motion = Vector2()
var vision_mode_on_cooldown = false

var disguised = false
var velocity_multiplier = 1

enum vision_mode {DARK, NIGHTVISION}


func _ready():
	Global.Player = self
	vision_mode = DARK
	$DisguiseTimer.wait_time = disguise_duration
	reveal()


func _process(delta):
	update_motion(delta)
	move_and_slide(motion * velocity_multiplier)
	if disguised:
		$Label.rect_rotation = -rotation_degrees
		$Label.text = str($DisguiseTimer.time_left).pad_decimals(2)


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
	elif disguises > 0:
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
	$Label.visible = true
	
	$Sprite.texture = load(Global.disguise_box_sprite)
	$Light2D.texture = load(Global.disguise_box_sprite)
	$LightOccluder2D.occluder = load(Global.disguise_box_occluder)
	
	velocity_multiplier = disguise_slow_down
	$DisguiseTimer.start()
	
	collision_layer = 16
	disguised = true
	disguises -= 1
	
	update_disguise_gui()


func reveal():
	$Label.visible = false
	
	$Sprite.texture = load(Global.player_sprite)
	$Light2D.texture = load(Global.player_sprite)
	$LightOccluder2D.occluder = load(Global.character_occluder)
	
	velocity_multiplier = 1
	
	collision_layer = 1
	disguised = false
	
	update_disguise_gui()


func update_disguise_gui():
	get_tree().call_group("DisguiseItemList", "update_disguises", disguises)