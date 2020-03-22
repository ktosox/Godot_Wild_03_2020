extends Path2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 100
var moving = false
var blockInput = false
var blockRotation = false

var lastPos = Vector2(0,0)
var direction = Vector2(1,1)
	# 1 for player / 
var attackReady = true
# Called when the node enters the scene tree for the first time.
func _ready():
	lastPos = $Mover.global_position
	
	pass # Replace with function body.

func check_for_turn():
#	if($Mover.global_position == lastPos):
#		pass

	var newDir = lastPos - $Mover.global_position
	
	newDir = newDir.clamped(1)
	
	if(abs(newDir.x)<0.5):
		newDir.x = 0
	else:
		newDir.x = sign(newDir.x)
	if(abs(newDir.y)<0.5):
		newDir.y = 0
	else:
		newDir.y = sign(newDir.y)
#	print(newDir)
	lastPos = $Mover.global_position
	if(newDir != direction):
		update_direction(newDir)
	pass

func update_direction(newDir):
	print(newDir)
	direction = newDir
	pass

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
		check_for_turn()
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
	# 0 - golem / 1- slime / 2-player
	match type:
		0:
			$Mover/Body.texture = load("res://Resources/ActorSpriteSheets/golem.png")

		1:

			$Mover/Body.texture = load("res://Resources/ActorSpriteSheets/slime.png")
		2:
			pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

