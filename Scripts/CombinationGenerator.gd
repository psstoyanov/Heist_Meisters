extends Node

export var lenght = 8

func generate_combination(lenght):
	var combination = []
	
	for number in range(lenght):
		randomize()
		
		combination.append(randi() % 10)
	
	return combination