extends Control
class_name InventoryActionModal

onready var _list_container : VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/ListMargin/ListContainer
onready var _title_label : Label = $PanelContainer/MarginContainer/VBoxContainer/HeaderMargin/HBoxContainer/Title

onready var _list_item = preload("res://src/ui/EntityListItem.tscn")

var _item_hotkeys := {}
var _entity : Entity

func init(entity: Entity) -> void:
	_clear_list()
	_entity = entity
	_title_label.set_text(_entity.display_name.capitalize())
	_add_menu_option("[d]", "Drop")
	_add_menu_option("[q]", "Quaff")
	show()

func _add_menu_option(shortcut: String, description: String) -> void:
	var item : EntityListItem = _list_item.instance()
	_list_container.add_child(item)
	item.init(shortcut, description, null)

func _clear_list() -> void:
	for child in _list_container.get_children():
		child.queue_free()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		queue_free()
	if not event is InputEventKey:
		return
	if event.is_action_pressed("ui_inventory_quaff"):
		print_debug("quaff " + _entity.display_name)
	get_tree().set_input_as_handled()
