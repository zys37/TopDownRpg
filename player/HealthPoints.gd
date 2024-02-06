extends Node2D

var health : int = 100
func _take_damage(damage: int) -> void:
	health -= damage
	if health <= 0:
		queue_free() #placeholder na smierc
