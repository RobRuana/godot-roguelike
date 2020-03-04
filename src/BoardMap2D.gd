extends TileMap
class_name BoardMap2D


func get_cells_by_type(cell_type: int) -> Array:
	return get_used_cells_by_id(cell_type)

func get_cell_type(map_pos: Vector2) -> int:
	return get_cellv(map_pos)

func set_cell_type(map_pos: Vector2, cell_type: int) -> void:
	set_cellv(map_pos, cell_type)
