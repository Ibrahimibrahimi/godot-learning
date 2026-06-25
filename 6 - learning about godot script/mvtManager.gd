extends Node


class_name MvtManager


# import directions names
var directions = preload("res://Directions.gd").new()

var entity = null
var speed = 0

func _init(node):
	entity = node
	speed = entity.speed

""" split mouvement directions methods """
func moveLeft(delta):
	entity.direction = directions.LEFT
	entity.position.x -= speed * delta
	
func moveRight(delta):
	entity.direction = directions.RIGHT
	entity.position.x += speed * delta

func moveUp(delta):
	entity.direction = directions.UP
	entity.position.y -= speed * delta

func moveDown(delta):
	entity.direction = directions.DOWN
	entity.position.y += speed * delta

""" move as the self_moving, if keyboard change the position or only the direction """
func move(delta):
	if entity.self_moving :
		keyboard_change_direction(delta)
		change_position_as_direction(delta)
	else :
		# change position only if keyboard pressed
		keyboard_change_position(delta)


""" keyboard affects direction & position """
# use keyboard to change only direction
func keyboard_change_direction(delta):
	if Input.is_action_pressed(directions.UP_KEY):
		entity.direction = directions.UP
	if Input.is_action_pressed(directions.RIGHT_KEY) :
		entity.direction = directions.RIGHT
	if Input.is_action_pressed(directions.LEFT_KEY):
		entity.direction = directions.LEFT
	if Input.is_action_pressed(directions.DOWN_KEY):
		entity.direction = directions.DOWN
	
	
# use keyboard to change both : position and direction 
func keyboard_change_position(delta):
	# check if keyboard pressed is an arrow key
	if Input.is_action_pressed(directions.UP_KEY):
		moveUp(delta)
	if Input.is_action_pressed(directions.RIGHT_KEY) :
		moveRight(delta)
	if Input.is_action_pressed(directions.LEFT_KEY):
		moveLeft(delta)
	if Input.is_action_pressed(directions.DOWN_KEY):
		moveDown(delta)

# use direction to change position
func change_position_as_direction(delta) :
	# change position as direction
		match entity.direction :
			directions.UP :
				moveUp(delta)
			directions.LEFT  :
				moveLeft(delta)
			directions.DOWN : 
				moveDown(delta)
			directions.RIGHT :
				moveRight(delta)
