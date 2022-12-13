extends Button

onready var balloon_path = get_parent().get_node("Balloon_Path") # Get node containing all spawned balloons
onready var blue_balloon = load("res://Balloons/Blue_Balloon.tscn") # Get node containing blue balloon

func _ready():
	connect("pressed", self, "_button_pressed") # Connect button action on self to script function
	
# Button pressed function
func _button_pressed():
	balloon_path.add_child(blue_balloon.instance())
