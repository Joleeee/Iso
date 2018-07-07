extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var y
var alpha = 1

func _ready():
	y = rect_position.y
	pass

func _process(delta):
	alpha = clamp(alpha - delta*1, 0, 1)
	y -= 36*delta
	rect_position.y = y
	var color = Color(1, 1, 1, alpha)
	add_color_override("font_color", color)
	if alpha <= 0:
		queue_free()