extends Node


onready var developer_splash = load("res://Boring_Nodes/Developer_Splash/Developer_Splash.tscn").instance()


func _ready():
	play_developer_splash()


func play_developer_splash():
	add_child(developer_splash)


## DEBUG
func _on_Mama_Node_child_entered_tree(node):
	print("Entered tree: " , node)


## DEBUG
func _on_Mama_Node_child_exiting_tree(node):
	print("Exited tree: " , node)
