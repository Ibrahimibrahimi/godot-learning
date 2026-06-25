extends Node

# importing external scripts
var PlayerClass = preload("res://Player.gd")

# create a sprite mode

# declaring variables

var player = PlayerClass.new()



# main functions 
func _process(delta):
	""" called every frame to update the views """
	player._process(delta)


func _ready():
	""" called to create all instances """
