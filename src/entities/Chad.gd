extends NPCEntity
class_name Chad

func _ready():
	pass

func _on_player_seen(map_pos: Vector2):
	._on_player_seen(map_pos)

func run_action(name: String, params: Dictionary):
	.run_action(name, params)

func _on_player_lost(map_pos: Vector2):
	._on_player_lost(map_pos)
