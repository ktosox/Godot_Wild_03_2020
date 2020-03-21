extends Path2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 100
var moving = false
var blockInput = false

	# 1 for player / 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func move(path):
	if(blockInput):
		return
	if(path.size()==0):
		return
	curve.clear_points()
	$Mover.offset = 0
	for x in range(path.size()):
		curve.add_point(path[x])
	moving = true
	pass

func setCamera():
	$Mover/Camera2D.current = true
	GM.currentCamera = $Mover/Camera2D
	pass

func _physics_process(delta):
	if(moving):
		if(!$AniamteJump.is_playing()):
			$AniamteJump.play("Slow")
		$Mover.offset += delta * speed
		if($Mover.unit_offset>=1):
			moving = false
			$AniamteJump.play("Stop")

func change_speed(newSpeed:float):
	print("before",$AniamteJump.playback_speed)
	$AniamteJump.playback_speed *= (newSpeed/speed)
	speed = newSpeed
	print("after",$AniamteJump.playback_speed)
	
	pass

func change_sprite(type:int): 
	#change Body-s texture to the selected spritesheet
	match type:
		0:
			pass
		1:
			pass
		2:
			pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

