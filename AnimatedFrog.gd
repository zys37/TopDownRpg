extends AnimatedSprite2D

signal attack_started

func start_attack_animation():
	play("Attack")
	emit_signal("attack_started")


func _on_attack_started():
	emit_signal("attack_started")
