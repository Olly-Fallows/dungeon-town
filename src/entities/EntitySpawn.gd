extends Node2D
class_name EntitySpawn

@export
var definition: EntityDefinition

func _ready() -> void:
	var entity = EntityFactory.create_entity(definition)
	entity.global_position = global_position
	get_parent().add_child.call_deferred(entity)
	queue_free()
