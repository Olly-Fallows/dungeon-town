extends CharacterBody2D
class_name Entity

signal dead

var sprite: AnimatedSprite2D
var hurtbox: Hurtbox

var stats: Stats

var states: Dictionary[String, State] = {}
var current_state: State

var hitbox_layer: int
var hitbox_mask: int

func _ready() -> void:
	stats.ready()
	hurtbox.hurt.connect(take_damage)

func change_state(next_state: String) -> void:
	while next_state in states.keys():
		current_state.exit(self)
		current_state = states[next_state]
		next_state = current_state.enter(self)
	if not next_state.is_empty():
		push_warning("Entity: " + name + " tried to move to state: " + next_state)
	

func _physics_process(delta: float) -> void:
	var next_state = current_state.physics(self, delta)
	change_state(next_state)

func _process(delta: float) -> void:
	var next_state = current_state.process(self, delta)
	change_state(next_state)

func take_damage(hitbox: Hitbox) -> void:
	stats.health = max(0, stats.health - hitbox.damage.amount)
	change_state("hurt")
	if stats.health <= 0:
		dead.emit()
		die()
		
func die() -> void:
	queue_free()
