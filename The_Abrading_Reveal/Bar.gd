extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Bar_mouse_entered():
	$Animator.play("scratch")
	pass # Replace with function body.


func _on_Bar_mouse_exited():
	if($Animator.is_playing()):
		$Animator.stop()
	pass # Replace with function body.
