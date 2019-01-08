extends TextureProgress

var suspicion = 0

# How much suspicion goes up when we are seen
export var suspicion_step = 1
# How fast suspicion falls
export var suspicion_dropoff = 0.5


func _process(delta):
	suspicion -= suspicion_dropoff
	suspicion = clamp(suspicion , 0 , max_value)
	value = suspicion


func player_seen():
	suspicion += suspicion_step
	if suspicion == max_value:
		end_game()


func end_game():
	get_tree().quit()