extends PathFollow2D


onready var map = get_parent().get_parent()
onready var curr_offset = get_offset()
onready var end_of_track = map.get_end_of_map()


var lives = 3
var speed = 350


func _physics_process(delta):
	curr_offset = get_offset()
	
	if curr_offset >= end_of_track:
		map.decrease_lives(lives)
		queue_free()
	elif lives <= 0:
		queue_free()
	else:
		set_offset(curr_offset + speed * delta)


## Universal functions
##
func decrease_lives(amount):
	lives -= amount


func get_speed():
	return speed
	
	
func set_speed(amount):
	speed = amount
