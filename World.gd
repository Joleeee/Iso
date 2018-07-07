extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var wood = 0
var stone = 0

var timer = 0
onready var logLabel = find_node("logLabel")
onready var plusOneScene = preload("res://PlusOne.tscn")


func _ready():
	pass

func _process(delta):
	logLabel.text = str(wood)
	timer -= delta
	if timer <= 0:
		collectResources()
		timer = 10
	pass

func collectResources():
	var cells = $TileMap/Buildings.get_used_cells_by_id($TileMap.TILE_TREE)
	wood += cells.size()
	for cell in cells.size():
		var vector = Vector2(cells[cell].x, cells[cell].y)
		vector = $TileMap/Buildings.map_to_world(vector)
		plusOne(vector)

func plusOne(position):
	position.x -= 16
	position.y -= 5
	var instance = plusOneScene.instance()
	instance.rect_position = position
	add_child(instance)
	pass