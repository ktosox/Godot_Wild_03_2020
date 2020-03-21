extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playerIsMoving = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _unhandled_input(event):
#	if(event.is_action_pressed("ui_up")):
#		$Player.fall_down()
	if(event.is_action_pressed("LMB")):
		update_player_move()
#	if(event.is_action_pressed("RMB")):
#		$Navigation.placeTile(get_global_mouse_position())
#		pass
func update_player_move():
	var target = get_global_mouse_position()
	target = $Navigation.get_closest_point(target)
	var path = $Navigation.get_simple_path($Navigation.get_closest_point($Player.get_current_poistion()),target,true)
	$Player.move(path)
	playerIsMoving = 0.4


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (playerIsMoving > 0.0):
		playerIsMoving-=delta
	elif(Input.is_action_pressed("LMB") and get_global_mouse_position().distance_to($Player.get_real_pos())>28):
		#the code above chcecks is the LMB is pressed and if the mouse isnt pointing at the player
		update_player_move()
	pass
