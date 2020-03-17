extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _unhandled_input(event):
#	if(event.is_action_pressed("ui_up")):
#		$Player.fall_down()
	if(event.is_action_pressed("LMB")):
		var target = get_global_mouse_position()
		target = $Navigation.get_closest_point(target)
		var path = $Navigation.get_simple_path($Navigation.get_closest_point($Player.get_current_poistion()),target,true)
		$Player.move(path)
#	if(event.is_action_pressed("RMB")):
#		$Navigation.placeTile(get_global_mouse_position())
#		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
