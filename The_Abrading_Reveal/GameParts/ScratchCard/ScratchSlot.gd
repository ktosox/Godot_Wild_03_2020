extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hidden = true

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_ScratchSlot_gui_input(event):
	if(event.is_action_pressed("LMB") and hidden):
		$Front.visible = false
		hidden = false
		var from = randf()*3.6
		print(from)
		$SoundEffect.play(from)
		$SoundEffect/Alter.play("Short")
	pass # Replace with function body.
