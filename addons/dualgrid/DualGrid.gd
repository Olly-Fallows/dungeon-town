@tool
extends Node2D
class_name DualGrid

# Tool Variables
@onready
var cursor_coord: Vector2i = global_to_map(get_global_mouse_position())
@export
var terrain_id: int = 0

# Exports
@export
var tile_size: Vector2i = Vector2i(16,16)
@export
var tile_set: Texture2D

# Regular Variables

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if not Engine.is_editor_hint():
		return
	if not self in EditorInterface.get_selection().get_selected_nodes():
		return
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		set_tile(cursor_coord, terrain_id)
	cursor_coord = global_to_map(get_global_mouse_position())
	queue_redraw()

func set_tile(coords: Vector2i, id: int) -> void:
	pass

func _draw() -> void:
	if not Engine.is_editor_hint():
		return
	if not self in EditorInterface.get_selection().get_selected_nodes():
		return
	draw_rect(Rect2(map_to_global(cursor_coord), tile_size), Color.WHITE, false, 1)

func map_to_global(coord: Vector2i) -> Vector2:
	return coord * tile_size
func global_to_map(pos: Vector2) -> Vector2i:
	return pos / Vector2(tile_size)
