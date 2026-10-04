extends State
class_name PlayerIdleState

var direction: Vector2

func enter(_entity: Entity) -> String:
	return ""

func exit(_entity: Entity) -> void:
	pass

func physics(entity: Entity, delta: float) -> String:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	entity.velocity = entity.velocity.lerp(direction * entity.speed, entity.acceloration * delta)
	entity.move_and_slide()
	return ""

func process(_entity: Entity, _delta: float) -> String:
	return ""
