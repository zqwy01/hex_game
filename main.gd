extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var mouse_position = get_global_mouse_position()
	var hexmap = get_node("TileMap")
	var tiles_postion = hexmap.local_to_map(to_local(mouse_position))
	
	for i in range(-250, 250):
		for j in range(-250, 250):
			hexmap.set_cell(-1, Vector2i(j, i), 1, Vector2i(0,0))
			hexmap.set_cell(-1, Vector2i(i, j), 1, Vector2i(0,0))
			
	for i in range(0, 47):
		for j in range(0, 47):
			hexmap.set_cell(-1, Vector2i(j, i), 1, Vector2i(randf_range(0, 3),randf_range(0, 3)))
			hexmap.set_cell(-1, Vector2i(i, j), 1, Vector2i(randf_range(0, 3), randf_range(0, 3)))
	

func _process(delta):
	var mouse_position = get_global_mouse_position()
	var hexmap = get_node("TileMap")
	var tiles_postion = hexmap.local_to_map(to_local(mouse_position))
	
	if Input.is_action_just_pressed("Click"):
		#Всё залить чёрным барьером, если нажимается на чёрный барьер = не получается
		if hexmap.get_cell_atlas_coords(-1, tiles_postion) != Vector2i(0,0):
			print('Цвет клетки: ', hexmap.get_cell_atlas_coords(-1, tiles_postion))
			print('Координаты клетки: ', tiles_postion)
			hexmap.set_cell(-1, tiles_postion, 1, Vector2i(0, 2))
			#hexmap.set_cell(tiles_postion.x, tiles_postion.y, -1)

func _enter_tree():
	set_multiplayer_authority(name.to_int())

func check_cells():
	print ('good')
	return (1)
