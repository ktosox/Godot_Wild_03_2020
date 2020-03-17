extends Node2D





# Called when the node enters the scene tree for the first time.
func _ready():
	GM.currentPlayer = self
	#GM.currentCamera = $Path2D/PathFollow2D/Camera2D
	pass # Replace with function body.


		
func move(path):
	$BaseGamePiece.move(path)
func get_current_poistion():
	return $BaseGamePiece/Mover.global_position
	

#func _on_Timer_Cloud_Refill_timeout():
#	$Interface/Overlay/Energy_Bar.value +=1

#func fall_down():
#	resetInventory()
#	blockInput = true
#	$Path2D/PathFollow2D.visible = false
#	$Path2D.curve.clear_points()
#	$Path2D/PathFollow2D.offset = 0
#	$Path2D.curve.add_point($Path2D/PathFollow2D.global_position)
#	$Path2D.curve.add_point(GM.spawnPoint.global_position)
#	$Path2D/PathFollow2D/Camera2D.drag_margin_bottom = 0
#	$Path2D/PathFollow2D/Camera2D.drag_margin_top = 0
#	$Path2D/PathFollow2D/Camera2D.drag_margin_left = 0
#	$Path2D/PathFollow2D/Camera2D.drag_margin_right = 0
#	GM.spawnPoint.spawnPlayer()
#	speed = 600
#	moving = true

#func respawn():
#	$Path2D/PathFollow2D/Camera2D.drag_margin_bottom = 0.2
#	$Path2D/PathFollow2D/Camera2D.drag_margin_top = 0.2
#	$Path2D/PathFollow2D/Camera2D.drag_margin_left = 0.2
#	$Path2D/PathFollow2D/Camera2D.drag_margin_right = 0.2
#	speed = 160
#	blockInput = false
#	$Path2D/PathFollow2D.visible = true

#func resetInventory():
#	$Interface/Overlay/Side_Menu/Menu_Holder/Player_Menu.wipeInventory()
#	pass
