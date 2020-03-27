extends Node2D


#STATS
var HP = 20
var attackCD = 1 # attack cooldown (sbustract this from the basic 4s attack cooldown)
var attackDMG = 1 # + attack points
var attackACC = 10 # how accurate the attack is
var defenceAC = 10 # armor class / chance of getting hit
var defenceRED = 0 # base damange reduction

# Called when the node enters the scene tree for the first time.
func _ready():
	$BaseGamePiece.change_sprite(0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
