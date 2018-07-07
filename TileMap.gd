extends TileMap

var id = -1

const TILE_BUILDING = 0
const TILE_TREE = 1

onready var world = get_parent()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _input(event):
	updateId(event)
	if event is InputEventMouseButton:
		place(event)

func place(event):
	if event.button_index == BUTTON_LEFT:
		var tilePosition = world_to_map(event.position)
		var lastTileId = $Buildings.get_cellv(tilePosition)
		
		if get_cellv(tilePosition) != -1 && lastTileId != id:
			if id == -1:
				pass
			elif lastTileId == -1:
				if id == TILE_BUILDING && world.wood >= 20:
					world.wood -= 20
				elif id == TILE_TREE && world.wood >= 4:
					world.wood -= 4
			else:
				return
			$Buildings.set_cellv(tilePosition, id)
			if lastTileId == TILE_TREE:
				world.wood += 8

func updateId(event):
	if event is InputEventKey:
		if event.scancode == KEY_0:
			id = TILE_BUILDING
		if event.scancode == KEY_1:
			id = TILE_TREE
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT:
			id = -1