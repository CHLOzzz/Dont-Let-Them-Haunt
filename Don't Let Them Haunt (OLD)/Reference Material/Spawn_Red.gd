extends Button

onready var balloon_path = get_parent().get_node("Balloon_Path") # Get node containing all spawned balloons
onready var red_balloon = load("res://Balloons/Red_Balloon.tscn")

func _ready():
	connect("pressed", self, "_button_pressed") # Connect button action on self to script function

# Button pressed function
func _button_pressed():
	balloon_path.add_child(red_balloon.instance())
