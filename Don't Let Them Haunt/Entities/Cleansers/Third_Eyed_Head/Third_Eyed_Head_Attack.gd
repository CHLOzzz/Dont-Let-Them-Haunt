extends Node2D


func _on_Detection_area_entered(area):
	if area.is_in_group("Soul"):
		area.get_parent().decrease_lives(1)
