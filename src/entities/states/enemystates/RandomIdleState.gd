extends State
class_name RandomIdleState

var direction: Vector2 = Vector2(randf_range(-1, 1), randf_range(-1, 1))
var timer: SceneTreeTimer

func enter(_entity: Entity) -> String:
	return ""

func exit(_entity: Entity) -> void:
	pass

func physics(entity: Entity, delta: float) -> String:
	direction = direction.lerp(Vector2(randf_range(-1, 1), randf_range(-1, 1)), 0.8*delta)
	entity.velocity = entity.velocity.lerp(direction * entity.stats.speed, entity.stats.acceloration * delta)
	entity.move_and_slide()
	return ""

func process(_entity: Entity, _delta: float) -> String:
	return ""
