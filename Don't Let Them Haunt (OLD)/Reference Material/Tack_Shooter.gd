extends Area2D

var balloons_in_sight = []

func _physics_process(delta):
	if balloons_in_sight != []: # If balloons in range
		pass

func _on_Tower_Detection_area_entered(area):
	if area.is_in_group("Balloon"):
		balloons_in_sight.append(area)
	print("Success")

func _on_Tack_Shooter_area_exited(area):
	if area.is_in_group("Balloon"):
		balloons_in_sight.erase(area)
