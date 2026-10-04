extends RefCounted
class_name EntityFactory

static func create_entity(definition: EntityDefinition) -> Entity:
	var entity: Entity = Entity.new()
	
	# Appearence
	var sprite: AnimatedSprite2D = AnimatedSprite2D.new()
	sprite.sprite_frames = definition.sprite
	entity.add_child(sprite)
	entity.sprite = sprite
	
	# Movement
	entity.speed = definition.speed
	entity.acceloration = definition.acceloration
	
	# Physics
	var collision_shape: CollisionShape2D = CollisionShape2D.new()
	collision_shape.shape = CircleShape2D.new()
	collision_shape.shape.radius = definition.size
	entity.add_child(collision_shape)
	
	# States
	entity.current_state = definition.idle_state.duplicate()
	entity.states.set("idle", entity.current_state)
	entity.states.set("hurt", definition.hurt_state.duplicate())
	entity.states.set("stun", definition.stun_state.duplicate())
	for state_key in definition.additional_states.keys():
		entity.states.set(state_key, definition.additional_states[state_key].duplicate())
	
	return entity
