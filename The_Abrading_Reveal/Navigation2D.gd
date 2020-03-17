extends Navigation2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if(event.is_action_pressed("LMB")):
		
		$BaseGamePiece.update_path(get_simple_path(get_closest_point($BaseGamePiece.global_position),get_global_mouse_position()))
		$BaseGamePiece.walk()
		#$BaseGamePiece.start_walking(get_global_mouse_position()-$BaseGamePiece.global_position)
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
