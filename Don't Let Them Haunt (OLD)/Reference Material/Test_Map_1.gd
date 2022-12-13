extends Node2D

var end_of_track = 3989
var lives

func _ready():
	lives = 100
	get_node("Lives").text = str(lives)

### Setter functions ###
# Strictly increase the number of lives the player has
func increase_lives(amount):
	lives += amount

# Strictly decrease the number of lives the player has
func decrease_lives(amount):
	lives -= amount
