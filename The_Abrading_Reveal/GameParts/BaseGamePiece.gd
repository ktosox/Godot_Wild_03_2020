extends Path2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 100
var moving = false
var blockInput = false
var blockRotation = false
var updateTurn = 0.1
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
	if(newDir != direction and !blockRotation):
		update_direction(newDir)
	pass

func update_direction(newDir):
	print(newDir)
	direction = newDir
	var sheet = 0
	match newDir:
		Vector2(0,1):
			sheet = 0
		Vector2(-1,1):
			sheet = 1
		Vector2(-1,0):
			sheet = 2
		Vector2(-1,-1):
			sheet = 3
		Vector2(0,-1):
			sheet = 4
		Vector2(1,-1):
			sheet = 5
		Vector2(1,0):
			sheet = 6
		Vector2(1,1):
			sheet = 7
	$Mover/Body.frame_coords.x = sheet
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
		updateTurn-=delta
		if(updateTurn<0):
			updateTurn=0.06
			check_for_turn()
		if(!$AniamteJump.is_playing()):
			$AniamteJump.play("Slow")
		$Mover.offset += delta * speed
		#print(get_parent().get_parent().get_cell($Mover.global_position))
		var gridcell  = get_parent().get_parent().get_cell($Mover.global_position)
		z_index = gridcell.x+gridcell.y
		if($Mover.unit_offset>=1):
			moving = false
			$AniamteJump.play("Stop")

func change_speed(newSpeed:float):
	print("before",$AniamteJump.playback_speed)
	$AniamteJump.playback_speed *= (newSpeed/speed)
	speed = newSpeed
	print("after",$AniamteJump.playback_speed)
	
	pass


func set_actor(newActor):
	match newActor:
		0:
			pass #golem
		1:
			pass # slime
		2:
			pass # player
	pass

func change_sprite(type:int): 
	#change Body-s texture to the selected spritesheet
	# 0 - golem / 1- slime / 2-player with sword / 3-player with spear
	match type:
		0:
			$Mover/Body.texture = load("res://Resources/ActorSpriteSheets/golem.png")
		1:
			$Mover/Body.texture = load("res://Resources/ActorSpriteSheets/slime.png")
		2:
			$Mover/Body.texture = load("res://Resources/ActorSpriteSheets/player_sword.png")
		3:
			$Mover/Body.texture = load("res://Resources/ActorSpriteSheets/player_spear.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func attack_wide():
	$Mover/Body.frame_coords.y = 2


	var targets = $Mover/AttackWide.get_overlapping_areas()
	for i in targets.size():
		 targets[i].land_hit(get_parent().attackDMG,0)

	$TimerAttackCooldown.start(get_parent().attackCD)
	$AnimateAttack.play("ResetAttack")
	$Mover/AttackWide/N.disabled = true
	$Mover/AttackWide/NE.disabled = true
	$Mover/AttackWide/E.disabled = true
	$Mover/AttackWide/SE.disabled = true
	$Mover/AttackWide/S.disabled = true
	$Mover/AttackWide/SW.disabled = true
	$Mover/AttackWide/W.disabled = true
	$Mover/AttackWide/NW.disabled = true


func attack_narrow():
	$Mover/Body.frame_coords.y = 2


	var targets = $Mover/AttackNarrow.get_overlapping_areas()

	for i in targets.size():
		 targets[i].land_hit(get_parent().attackDMG,0)
	$Mover/AttackNarrow/N.disabled = true
	$Mover/AttackNarrow/NE.disabled = true
	$Mover/AttackNarrow/E.disabled = true
	$Mover/AttackNarrow/SE.disabled = true
	$Mover/AttackNarrow/S.disabled = true
	$Mover/AttackNarrow/SW.disabled = true
	$Mover/AttackNarrow/W.disabled = true
	$Mover/AttackNarrow/NW.disabled = true
	$TimerAttackCooldown.start(get_parent().attackCD)
	$AnimateAttack.play("ResetAttack")

func attack_start(type): # 0 for narrow / 1 for wide
	if(!attackReady):
		return
	attackReady = false
	blockRotation = true
	$Mover/Body.frame_coords.y = 1
	match(type):
		0:
			match int($Mover/Body.frame_coords.x): # enable the correct colision object
				0:
					$Mover/AttackNarrow/N.disabled = false
				1:
					$Mover/AttackNarrow/NE.disabled = false
				2:
					$Mover/AttackNarrow/E.disabled = false
				3:
					$Mover/AttackNarrow/SE.disabled = false
				4:
					$Mover/AttackNarrow/S.disabled = false
				5:
					$Mover/AttackNarrow/SW.disabled = false
				6:
					$Mover/AttackNarrow/W.disabled = false
				7:
					$Mover/AttackNarrow/NW.disabled = false
			$AnimateAttack.play("AttackNarrow")
		1:
			match int($Mover/Body.frame_coords.x): # enable the correct colision object
				0:
					$Mover/AttackWide/N.disabled = false
				1:
					$Mover/AttackWide/NE.disabled = false
				2:
					$Mover/AttackWide/E.disabled = false
				3:
					$Mover/AttackWide/SE.disabled = false
				4:
					$Mover/AttackWide/S.disabled = false
				5:
					$Mover/AttackWide/SW.disabled = false
				6:
					$Mover/AttackWide/W.disabled = false
				7:
					$Mover/AttackWide/NW.disabled = false
			$AnimateAttack.play("AttackWide")

func attack_end():
	$Mover/Body.frame_coords.y = 0
	blockRotation = false

	pass
func _on_TimerAttackCooldown_timeout():
	attackReady = true
	pass # Replace with function body.
