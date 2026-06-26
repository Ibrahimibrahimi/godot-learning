extends KinematicBody2D
"""
rayCast is an arrow that indicates the direction of the player , 
it helps detect collision and if player can move or not
"""

onready var ray = $RayCast2D

const PIXEL_SIZE = 16

var directions = {
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN,
	"ui_left" : Vector2.LEFT,
	"ui_right" : Vector2.RIGHT
}

#func _process(delta):
#	$AnimationPlayer.play("dancing")


func _unhandled_input(event):
	# handle directions input
	for direction in directions.keys() :
		if event.is_action_pressed(direction) :
			move(direction)
		if event.is_action_pressed("restart") :
			get_tree().reload_current_scene()
	pass

func move(direction):
	# calculate the position of the next direction
	var vector_pos = directions[direction] * PIXEL_SIZE
	
	# change the direction of the rayCast(the arrow) to the same as the player
	ray.cast_to = vector_pos
	
	# update the rayCast make it check if there is a  collisions 
	ray.force_raycast_update()
	
	# using Tween for smooth animations
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
		
		var collider = ray.get_collider() # get the object collided with
		
		if collider.is_in_group("Box") : # if the object collided with is in Box group
			# check if can move in that direction
			if collider.move(direction) :
				# position += vector_pos
				# using Tween for smooth transform position
				$Tween.start()
	else :
		#position += vector_pos
		$Tween.start()





