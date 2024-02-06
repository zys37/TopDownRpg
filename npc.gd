extends CharacterBody2D

const speed = 30
var current_state = MOVE
var dir = Vector2.RIGHT

enum {
	IDLE,
	NEW_DIR,
	MOVE
}

func _ready():
	randomize()

var start_position = global_position


func _process(delta):
	if current_state == 0:
		$AnimatedSprite2D.play("idle")
	if current_state == 1:
		$AnimatedSprite2D.play("idle")
	if current_state == 2:
		$AnimatedSprite2D.play("default")
	match current_state:
		NEW_DIR:
			dir = choose([Vector2.RIGHT,Vector2.UP,Vector2.LEFT,Vector2.DOWN])
		MOVE:
			move(delta)

func move(delta):
	position+=dir*speed*delta
	if dir.x == 1:
		$AnimatedSprite2D.flip_h = false
	elif dir.x == -1:
		$AnimatedSprite2D.flip_h = true
	if position.x >= start_position.x + 40:
		position.x = start_position.x + 39.9
	if position.x <= start_position.x - 40:
		position.x = start_position.x - 39.9
	if position.y >= start_position.y + 20:
		position.y = start_position.y + 19.9
	if position.y <= start_position.y - 20:
		position.y = start_position.y - 19.9
func choose(array):
	array.shuffle()
	return array.front()


func _on_timer_timeout():
	$Timer.wait_time = choose([0.5,1,1.2])
	current_state = choose([NEW_DIR,MOVE,IDLE])

func npc():
	pass
