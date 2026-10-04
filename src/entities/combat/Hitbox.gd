extends Area2D
class_name Hitbox

signal hit(hurtbox: Hurtbox)

var damage: Damage

func _ready() -> void:
	area_entered.connect(func(area: Area2D):
		if area is Hurtbox:
			hit.emit(area))
