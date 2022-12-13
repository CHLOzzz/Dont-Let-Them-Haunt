extends TextureButton


onready var third_eyed_head = load("res://Cleansers/Third_Eyed_Head.tscn")


var third_eyed_head_ready = false


func _physics_process(_delta):
	if Input.is_action_pressed("left_click") and third_eyed_head_ready:
		var cursor_location = get_global_mouse_position()
		
		if cursor_location[0] < margin_left or cursor_location[0] > margin_right or cursor_location[1] < margin_top or cursor_location[1] > margin_bottom:
			var head_instance = third_eyed_head.instance()
			
			third_eyed_head_ready = false
			get_parent().add_child(head_instance)
			head_instance.drag(true)


func _on_Spawn_Third_Eyed_Head_button_down():
	third_eyed_head_ready = true


func _on_Spawn_Third_Eyed_Head_mouse_exited():
	if third_eyed_head_ready:
		get_parent().add_child(third_eyed_head.instance())
		third_eyed_head_ready = false
