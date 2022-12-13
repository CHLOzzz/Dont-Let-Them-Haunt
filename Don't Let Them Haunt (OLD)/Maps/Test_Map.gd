extends Node


onready var path = $Enemy_Path
onready var nobody_ghost = load("res://Souls/Nobody_Ghost.tscn")
onready var test_wave_timer = $Test_Wave_Timer
onready var lives_display = $Lives


var spawn_count
var lives = 100
var third_eyed_head_ready = false


func _ready():
	lives_display.text = str(lives)


func _on_Spawn_Nobody_Ghost_pressed():
	if test_wave_timer.is_stopped():
		test_wave_timer.set("wait_time" , 0.25)
		spawn_count = 5 - 1
		path.add_child(nobody_ghost.instance())
		test_wave_timer.start()


func _on_Wave_Timer_timeout():
	if spawn_count > 0:
		spawn_count -= 1
		path.add_child(nobody_ghost.instance())
	else:
		test_wave_timer.stop()


func _on_Main_Menu_pressed():
	get_parent().add_child(load("res://Boring_Nodes/Main_Menu.tscn").instance())
	queue_free()


## Universal map functions
##
func get_end_of_map():
	return 2001


func get_lives():
	return lives
	
	
func decrease_lives(amount):
	if amount > lives:
		lives = 0
	else:
		lives -= amount
	
	lives_display.text = str(lives)
