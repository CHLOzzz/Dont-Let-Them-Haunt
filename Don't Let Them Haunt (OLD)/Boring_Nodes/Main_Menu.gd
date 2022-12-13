extends Node


func _on_Play_Test_Map_pressed():
	get_parent().add_child(load("res://Maps/Test_Map.tscn").instance()) # Add test map to the scene
	queue_free() # Remove node from currently running application
