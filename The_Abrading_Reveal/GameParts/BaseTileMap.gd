extends TileMap

var crateScene = preload("res://GameParts/Junk/Crate.tscn")
var barrelScene = preload("res://GameParts/Junk/Barrel.tscn")
var trap1Scene = preload("res://GameParts/Traps/SpikeTrap.tscn")
var pillarScene = preload("res://GameParts/Junk/Pillar.tscn")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func load_level():
	#scan tiles and replace every special tile 
	pass

func replace_tile(tile,mapPos:Vector2):
	match tile: # match tile IDs with objects
		4:
			pass
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
