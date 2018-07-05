extends TileMap

var id = -1

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_0:
			id = 0
		if event.scancode == KEY_1:
			id = 1
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT:
			id = -1
		var tile = world_to_map(event.position)
		if get_cellv(tile) != -1:
			$Buildings.set_cellv(tile, id)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
