extends State
class_name EnemyAttack

@export var enemy: CharacterBody2D
var player : CharacterBody2D
var attacking: bool = false
var attack_cooldown: float = 4.0
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	attacking = true
	
		
func Physics_Update(delta: float):
	var direction = player.global_position - enemy.global_position
	if !attacking && enemy.get_animation_player().is_playing("Attack") == false:
		Transitioned.emit(self,"EnemyFollow")
	if direction.length() > 60:
		Transitioned.emit(self,"Idle")
