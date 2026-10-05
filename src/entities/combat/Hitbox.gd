extends Area2D
class_name Hitbox

signal hit(hurtbox: Hurtbox)

var damage: Damage

func _ready() -> void:
	area_entered.connect(func(area: Area2D):
		if area is Hurtbox:
			hit.emit(area))

func disable() -> void:
	for c in get_children():
		if c is CollisionShape2D:
			c.disabled = true

func enable() -> void:
	for c in get_children():
		if c is CollisionShape2D:
			c.disabled = false
