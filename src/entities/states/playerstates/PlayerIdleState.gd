extends State
class_name PlayerIdleState

var direction: Vector2

func enter(_entity: Entity) -> String:
	return ""

func exit(_entity: Entity) -> void:
	pass

func physics(entity: Entity, delta: float) -> String:
	if Input.is_action_just_pressed("attack"):
		return "attack"
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	entity.velocity = entity.velocity.lerp(direction * entity.stats.speed, entity.stats.acceloration * delta)
	entity.move_and_slide()
	return ""

func process(entity: Entity, _delta: float) -> String:
	if entity.velocity.length() < 10:
		entity.sprite.play("idle")
	else:
		entity.sprite.play("run")
		if entity.velocity.x < 0:
			entity.sprite.flip_h = true
		elif entity.velocity.x > 0:
			entity.sprite.flip_h = false
	return ""
