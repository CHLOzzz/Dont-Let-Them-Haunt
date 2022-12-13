extends PathFollow2D

# Onready variables
onready var map = get_parent().get_parent()
onready var end_offset = map.get("end_of_track")

# Balloon property variables
var speed = 500
var balloon_worth = 2
var curr_offset

### Main function ###
# Called on every running frame; delta is the inverse of the current frame rate
func _physics_process(delta):
	curr_offset = get_offset()
	
	if curr_offset >= end_offset: # If at end of track
		calculate_score()
		queue_free()
	else:
		set_offset(curr_offset + speed * delta)

### Helper functions ###
# Called when balloon reaches end of track; calculate and display new lives counter
func calculate_score():
	if map.get("lives") > balloon_worth:
		map.decrease_lives(balloon_worth)
		map.get_node("Lives").text = str(map.get("lives"))
	else:
		map.decrease_lives(map.get("lives"))
