extends Resource
class_name Stats

@export
var max_health: int = 5
var health: int = max_health

@export
var speed: float
@export
var acceloration: float

@export
var weapon: Weapon

func ready() -> void:
	health = max_health
