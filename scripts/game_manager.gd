extends Node

# Now we know the GameManager is only one in the scene
# So, we attribute it as Unique so when referencing it from nested scene
# we can easily import (Its the best practice)

# := is same as : int = 0
var score := 0

@onready var score_label: Label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "You have collected " + str(score) + " Coins"
	print(score)
