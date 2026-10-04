@abstract
extends Resource
class_name State

@abstract
func enter(entity: Entity) -> String

@abstract
func exit(entity: Entity) -> void

@abstract
func physics(entity: Entity, delta: float) -> String

@abstract
func process(entity: Entity, delta: float) -> String
