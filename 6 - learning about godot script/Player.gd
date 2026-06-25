extends Area2D

class_name PlayerClass



# position & speed
var startX = 100
var startY = 100
var speed = 55
var direction = preload("res://Directions.gd").new().DEFAULT
var landed = false # touch land
var mvtManager = null
var self_moving = false # if true => can move just in the direction , no need to press keyboard

# sprite & texture
var sprite = Sprite.new()


# methods
func _process(delta):
	move(delta)

func _init():
	
	# init the mouvement manager
	mvtManager = preload("res://mvtManager.gd").new(self)
	
	# init sprite image and position...
	sprite.texture = preload("res://icon.png")
	
	# add to the root node
	add_child(sprite)

func move(delta):
	mvtManager.move(delta)
