extends CharacterBody2D
class_name Entity

var sprite: AnimatedSprite2D

var speed: float
var acceloration: float

var states: Dictionary[String, State] = {}
var current_state: State

func _physics_process(delta: float) -> void:
	var next_state = current_state.physics(self, delta)
	while next_state in states.keys():
		current_state.exit(self)
		current_state = states[next_state]
		next_state = current_state.enter(self)
