extends Resource
class_name EntityDefinition

@export_category("Appearence")
@export
var sprite: SpriteFrames

@export_category("Stats")
@export
var stats: Stats

@export_category("Physics")
@export
var size: int
@export_flags_2d_physics
var collision_layer: int
@export_flags_2d_physics
var collision_mask: int

@export_flags_2d_physics
var hurtbox_layer: int
@export_flags_2d_physics
var hurtbox_mask: int

@export_flags_2d_physics
var hitbox_layer: int
@export_flags_2d_physics
var hitbox_mask: int

@export_category("States")
@export
var idle_state: State = IdleState.new()
@export
var hurt_state: State = HurtState.new()
@export
var stun_state: State = StunState.new()

@export
var additional_states: Dictionary[String, State] = {}


@export_category("Metadata")
@export
var groups: Array[String] = []
