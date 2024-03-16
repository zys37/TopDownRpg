extends CharacterBody2D
class_name FrogEnemy
const Attack_distance = 35
var health = 100
func _physics_process(delta):
	var player = get_tree().get_first_node_in_group("Player")
	var direction = player.global_position - global_position
	if velocity.length() > 0:
		$AnimatedFrog.play("run")
		if velocity.x > 0:
			$AnimatedFrog.flip_h = false
		else:
			$AnimatedFrog.flip_h = true
	
	
	var distance_to_player = global_position.distance_to(player.global_position)
	
	if distance_to_player <= Attack_distance:
		$AnimatedFrog.play("Attack")
		if direction.x > 0:
			$AnimatedFrog.flip_h = false
		else:
			$AnimatedFrog.flip_h = true
func enemy():
	pass
