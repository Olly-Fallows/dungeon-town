extends Hitbox
class_name MeleeAttack

@export
var animation: AnimatedSprite2D

func _ready() -> void:
	animation.animation_finished.connect(queue_free)
