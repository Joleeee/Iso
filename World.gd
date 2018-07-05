extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var wood = 0
var stone = 0

var timer = 10
onready var logLabel = find_node("logLabel")


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	logLabel.text = str(wood)
	timer -= delta
	if timer <= 0:
		collectResources()
		timer = 10
	pass

func collectResources():
	wood += $TileMap/Buildings.get_used_cells_by_id($TileMap.TILE_TREE).size()