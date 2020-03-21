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
	load_level()
	pass # Replace with function body.

func load_level():
	var allTiles = get_used_cells()
	for i in allTiles.size():
#		print(get_cellv(allTiles[i]))
		match get_cellv(allTiles[i]):
			5:
				place_pillar(allTiles[i])
			9:
				place_barrel(allTiles[i])
			10:
				place_crate(allTiles[i])
	pass

func place_barrel(where):

	var newBarrel = barrelScene.instance()
	newBarrel.global_position = map_to_world(where)
	add_child(newBarrel)
	pass

func place_crate(where):

	var newCrate = crateScene.instance()
	newCrate.global_position = map_to_world(where)
	add_child(newCrate)
	pass

func place_pillar(where):

	var newThing= pillarScene.instance()
	newThing.global_position = map_to_world(where)
	add_child(newThing)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
