extends State
class_name PlayerAttackState

var attack: MeleeAttack

func enter(entity: Entity) -> String:
	var target = entity.get_global_mouse_position()
	attack = entity.stats.weapon.hitbox.instantiate()
	#attack.global_position = entity.global_position
	attack.collision_mask = entity.hitbox_mask
	attack.collision_layer = entity.hitbox_layer
	entity.add_child(attack)
	attack.look_at(target)
	entity.sprite.play("idle")
	return ""

func exit(_entity: Entity) -> void:
	pass

func physics(_entity: Entity, _delta: float) -> String:
	if attack:
		if attack.animation.is_playing():
			return ""
	else:
		return "idle"
	return ""

func process(_entity: Entity, _delta: float) -> String:
	return ""
