extends Node2D

## Load resources
onready var spawn_timer = $Path/Spawn_Timer
onready var path = $Path
onready var nobody_ghost = load("res://Entities/Ghosts/Nobody_Ghost/Nobody_Ghost.tscn")
onready var third_eyed_head = load("res://Entities/Cleansers/Third_Eyed_Head/Third_Eyed_Head.tscn").instance()
onready var level_select = load("res://Boring_Nodes/Level_Select/Level_Select.tscn")


func _ready():
	self.add_child(third_eyed_head)
	randomize() # Seed RNG
	spawn_timer.set("wait_time" , 5)
	spawn_timer.start()
	third_eyed_head.set("on_ground" , true)
	third_eyed_head.set("scale" , Vector2(0.5,0.5))
	third_eyed_head.set("position" , Vector2(515,365))
	third_eyed_head.set("dragging" , false)
	third_eyed_head.get_node("Detection").get_node("Visual_Detection").hide() # Manually hide detection radius


func _on_Spawn_Timer_timeout():
	path.add_child(nobody_ghost.instance())
	spawn_timer.set("wait_time" , (randf() + 1) / 2)
	spawn_timer.start()


func get_end_of_map():
	return 4555


func decrease_lives(_amount):
	third_eyed_head.modulate.r8 += 3
	third_eyed_head.set("scale" , third_eyed_head.get("scale") + Vector2(0.005,0.005))


func _on_Play_Button_pressed():
	get_parent().add_child(level_select.instance())
	queue_free()
