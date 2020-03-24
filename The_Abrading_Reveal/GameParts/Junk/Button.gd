extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var TARGET = Vector2(0,0)
export var active = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if(active):
		active = false
		$Press.play("New Anim")
		get_parent().get_parent().open_door(TARGET)
	pass # Replace with function body.
