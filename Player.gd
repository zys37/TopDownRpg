extends CharacterBody2D
const ACCELERATION=500
const MAX_SPEED=80
const FRICTION=500
var npc_in_range = false
enum {
	MOVE,
	ROLL,
	ATTACK
}
var enemy_inattack_range = false
var enemy_attack_cooldown =  true
var player_alive = true
var health = 100
var state = MOVE
@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")
func _ready():
	animationTree.active = true

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	input_vector.y = Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Run")
		velocity=velocity.move_toward(input_vector*MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
func attack_state(delta):
	animationState.travel("Attack")
func attack_animation_finished():
	state = MOVE
	
	
func _physics_process(delta):
	enemy_attack()
	if health <= 0:
		player_alive = false #dodaj cos z ginieciem
		health = 0
		get_tree().change_scene_to_file("res://deathscreen.tscn")
	match state:
		MOVE:
			move_state(delta)
		ROLL:
			pass
		ATTACK:
			attack_state(delta)
	if npc_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://mian.dialogue"), "start")
			return
	


func _on_detection_body_entered(body):
	if body.has_method("npc"):
		npc_in_range = true


func _on_detection_body_exited(body):
	if body.has_method("npc"):
		npc_in_range = false
	
		

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true


func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false
func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown:
		health-=10
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print(health)
	pass
func player():
	pass

func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true
