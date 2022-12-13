extends Node2D


onready var main_menu = load("res://Boring_Nodes/Main_Menu/Main_Menu.tscn").instance()


func _ready():
	$Animation.play("Animate Logo")


func _physics_process(_delta):
	if Input.is_action_just_released("any_key"): # Allow player to skip opening cutscene
		_on_Animation_animation_finished()


func _on_Animation_animation_finished(): # Add main menu to scene and delete self from memory
	get_parent().add_child(main_menu)
	queue_free()
