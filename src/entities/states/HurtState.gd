extends State
class_name HurtState

var timer: SceneTreeTimer

func enter(entity: Entity) -> String:
	timer = entity.get_tree().create_timer(0.5, false, true, false)
	entity.modulate = Color.RED
	entity.hurtbox.disable()
	return ""

func exit(entity: Entity) -> void:
	entity.modulate = Color.WHITE
	entity.hurtbox.enable()
	pass

func physics(_entity: Entity, _delta: float) -> String:
	if timer.time_left == 0:
		return "idle"
	return ""

func process(_entity: Entity, _delta: float) -> String:
	return ""
