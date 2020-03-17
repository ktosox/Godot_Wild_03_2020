extends Path2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 160
var moving = false
var blockInput = false

	# 1 for player / 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func move(path):
	if(blockInput):
		return
	curve.clear_points()
	$Mover.offset = 0
	for x in range(path.size()):
		curve.add_point(path[x])
	moving = true
	pass



func _physics_process(delta):
	if(moving):
		if(!$AniamteJump.is_playing()):
			$AniamteJump.play("Slow")
		$Mover.offset += delta * speed
		if($Mover.unit_offset>=1):
			moving = false
			$AniamteJump.play("Stop")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

