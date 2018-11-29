extends "res://Scripts/Character.gd"

var motion = Vector2()


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
	$Sprite.look_at(get_global_mouse_position())