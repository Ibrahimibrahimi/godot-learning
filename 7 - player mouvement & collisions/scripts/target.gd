extends KinematicBody2D
"""
rayCast is an arrow that indicates the direction of the player , 
it helps detect collision and if player can move or not
"""

onready var ray = $RayCast2D

const PIXEL_SIZE = 16


var directions  = {
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN,
	"ui_left" : Vector2.LEFT,
	"ui_right" : Vector2.RIGHT
}

func move(direction):
	
	# calculate the position of the next direction
	var vector_pos = directions[direction] * PIXEL_SIZE
	
	# change the direction of the rayCast(the arrow) to the same as the player
	ray.cast_to = vector_pos
	
	# update the rayCast make it check for new collisions
	ray.force_raycast_update()
	
	# for smooth animations
	$Tween.interpolate_property(
		self, # target node
		"position", # animation name
		position, # starting point 
		position + vector_pos, # ending point 
		0.1, # duration in s
		Tween.TRANS_SINE,
		Tween.EASE_IN # animation type
		)
	
	# if rayCast detects collision 
	if ray.is_colliding() :
		# do not move
		return false
	else :
		position += vector_pos # move as the direction 
		# Use Tween for smooth moving
		# $Tween.start()
		return true






