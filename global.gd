extends Node2D

const TILE_BUILDING = 0
const TILE_TREE = 1

onready var tileScript = preload("res://tile.gd")
onready var tiles

func _ready():
	tiles = {TILE_TEE : Tile(10)}
	pass