extends Node2D


var mouse_on_Spawn_Tower_Menu = false


func _physics_process(delta):
	if mouse_on_Spawn_Tower_Menu:               # If menu should be up
		if $Spawn_Tower_Menu.position.y > -150: # If menu isn't up
			moving_Spawn_Tower_Menu_up(delta)
	else:                                       # If menu should be down
		if $Spawn_Tower_Menu.position.y < 0:    # If menu isn't down
			moving_Spawn_Tower_Menu_down(delta)


func _on_Spawn_Tower_Menu_mouse_entered():
	mouse_on_Spawn_Tower_Menu = true


func _on_Spawn_Tower_Menu_mouse_exited():
	mouse_on_Spawn_Tower_Menu = false


func moving_Spawn_Tower_Menu_up(delt):
	$Spawn_Tower_Menu.position.y -= delt * ($Spawn_Tower_Menu.position.y + 150) + (1 - delt)


func moving_Spawn_Tower_Menu_down(delt):
	$Spawn_Tower_Menu.position.y -= delt * ($Spawn_Tower_Menu.position.y) - (1 - delt)
