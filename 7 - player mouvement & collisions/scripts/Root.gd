extends Node2D


var Game_end = false

func _process(delta):
	#if Game_end :
	#	get_tree().paused = true
	check_game_end()
	
	pass

func check_game_end() :
	# verify that all spots are full
	
	if Game_end == false :
		# $Node is used to define the node child of the root tree
		var spots = $Spots.get_child_count()
		for i in $Spots.get_children() :
			if i.in_spot :
				spots -= 1
		if spots == 0 :
			$AcceptDialog.popup()
			Game_end = true




func _on_AcceptDialog_confirmed():
	get_tree().reload_current_scene()




func _on_AcceptDialog_popup_hide():
	get_tree().reload_current_scene()
