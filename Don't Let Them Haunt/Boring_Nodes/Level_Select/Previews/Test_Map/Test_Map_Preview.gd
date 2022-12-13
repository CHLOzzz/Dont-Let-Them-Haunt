extends Node2D


onready var test_map = load("res://Maps/Test_Map/Test_Map.tscn")


func _on_TextureButton_mouse_entered():
	$Sprite.modulate.a8 = 175


func _on_TextureButton_mouse_exited():
	$Sprite.modulate.a8 = 255


func _on_TextureButton_pressed():
	get_parent().get_parent().get_parent().add_child(test_map.instance())
	get_parent().get_parent().queue_free()
